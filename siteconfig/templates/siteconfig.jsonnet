local inputs = import 'inputs.libsonnet'; 

[{

  // Look man, here is comment in jsonnet
  apiVersion: 'ran.openshift.io/v1',
  kind: 'SiteConfig',
  metadata: {
    name: inputs.clusters[0].cluster_name,
    namespace: inputs.clusters[0].cluster_name,
    annotations: {
      'argocd.argoproj.io/sync-wave': '2',
    },
  },
  spec: {
    baseDomain: inputs.clusters[0].base_domain,
    pullSecretRef: {
      name: 'pull-secret',
    },
    clusterImageSetNameRef: inputs.clusters[0].ocp_version,
    sshPublicKey: inputs.clusters[0].ssh_pubkey,
    clusters: [
      {
        clusterName: inputs.clusters[0].cluster_name,
        networkType: 'OVNKubernetes',
        clusterLabels: {
          'du-profile': inputs.clusters[0].cluster_labels["du-profile"],
          'common': true,
          'group-du-sno': '',
          sites: inputs.clusters[0].cluster_name,
        },
        clusterNetwork: [
          {
            cidr: '10.128.0.0/14',
            hostPrefix: 23,
          },
        ],
        machineNetwork: [
          {
            cidr: inputs.clusters[0].machine_network,
          },
        ],
        serviceNetwork: [
          '172.30.0.0/16',
        ],
        additionalNTPSources: [
          'clock.redhat.com',
        ],
              
        [if inputs.mode == "COMPACT" then 'apiVIP' else null]: inputs.clusters[0].api_vip,
        [if inputs.mode == "COMPACT" then 'ingressVIP' else null]: inputs.clusters[0].ingress_vip,

        # For loop for the nodes
               
        nodes: [
          
          # call for interfaces 
          local filtered = std.filter(function(x) x.target == 'primary', inputs.clusters[0].nodes[i].networks);
          local bootmacaddress = std.map(function(x) x.mac, filtered);
          local gw = std.map(function(x) x.routes[0].gw, filtered);
          local primary_int = std.map(function(x) x.int_name, filtered);

          # get BMC address
          local filtered = std.filter(function(x) x.target == 'ilo', inputs.clusters[0].nodes[i].networks);
          local bmcaddress = std.map(function(x) x.ip, filtered);
          local bmcaddress_ip = std.split(bmcaddress[0], "/")[0];

          {
            hostName: inputs.clusters[0].nodes[i].hostname,
            role: 'master',
            bmcAddress: 'redfish-virtualmedia://' + bmcaddress_ip + '/redfish/v1/Systems/1',
            bmcCredentialsName: {
              name: 'bmc-secret-' + inputs.clusters[0].cluster_name, 
            },
            bootMACAddress: bootmacaddress[0],
            bootMode: 'UEFI',
            rootDeviceHints: {
              deviceName: inputs.clusters[0].nodes[i].installation_disk,
            },
            nodeNetwork: {
              interfaces: [
                {
                  name: inputs.clusters[0].nodes[i].networks[s].int_name,
                  macAddress: inputs.clusters[0].nodes[i].networks[s].mac,
                },
                # start from 1 as idrac doesn have in_name
              for s in std.range(1, std.length(inputs.clusters[0].nodes[i].networks) - 1)
              ],
              config: {
                interfaces: [
                  {
                    name: inputs.clusters[0].nodes[i].networks[s].int_name,
                    type: 'ethernet',
                    ipv4: {
                      enabled: inputs.clusters[0].nodes[i].networks[s].enabled,
                      dhcp: inputs.clusters[0].nodes[i].networks[s].dhcp,
                      [if std.objectHas(inputs.clusters[0].nodes[i].networks[s], "ip") then 'address' else null]: [ {'ip': std.split(inputs.clusters[0].nodes[i].networks[s].ip, "/")[0],'prefix-length': std.parseInt(std.split(inputs.clusters[0].nodes[i].networks[s].ip, "/")[1])}],
                    },
                  },
                 for s in std.range(1, std.length(inputs.clusters[0].nodes[i].networks) - 1)  
                ],
                'dns-resolver': {
                  config: {
                    search: [
                      inputs.clusters[0].dns_search[0],
                    ],
                    server: [
                      inputs.clusters[0].dns_servers[0],
                    ],
                  },
                },
                routes: {
                  config: [
                    {
                      destination: '0.0.0.0/0',
                      'next-hop-interface': primary_int[0],
                      'next-hop-address': gw[0],
                      'table-id': 254,
                    },
                  ],
                },
              },
            },
          },
        # For loop base on the size
        for i in std.range(0, std.length(inputs.clusters[0].nodes) - 1)
    
        ],

      },
    ],
  },
},]
