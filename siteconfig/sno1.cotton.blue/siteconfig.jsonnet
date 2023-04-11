


// This is test for Jsonnet template.

{
  "apiVersion": "ran.openshift.io/v1",
  "kind": "SiteConfig",
  "metadata": {
    "name": "sno1",
    "namespace": "sno1",
    "annotations": {
      "argocd.argoproj.io/sync-wave": "2"
    }
  },
  "spec": {
    "baseDomain": "cotton.blue",
    "pullSecretRef": {
      "name": "assisted-deployment-pull-secret"
    },
    "clusterImageSetNameRef": "img4.10.52-x86-64-appsub",
    "sshPublicKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDaqy7YhU9yx28InBRttTWDrsAMqn1txv4Z7ObxrK5ywlILf8LZdWMf8AehwMcxYrkwfC5G48dej6lKXkopQwmu7HCvTtVeU8gn07J6kSl3riAGsbX1wbuCiCjxIXUtHDZUCqc/ZUF/b6efGW0xcmc3fg3xgSWz3YYsH4zWxv211ISfavOjHTHQuVr7ibzEGJrz5S4xJJAY8v9XaYkxbUcaMm2IUFQG7S3RRMywMCSvyhUlPM6/btIVKXfiPy3+nnXhtll2zM3OIVSLOwGQDYhwRxP9TX3vyxidekmxk2gor1aL8S364nNipZITXx5hMHRWrtAX+bgb3FHDdRn9BEYOPLvPVNPKfFZiNULp9ar9QrV1wcfWYGuJ9QSkwfDuRkWVD3KgoZpLEsujP6eAGacyh8jhcv/M5SY5L/sPiX8fklBNWLSuPpMhZAAM1LeKz8iV/GK3jDdVA7nhG7MTRAB0RHnRljDkGcfiEbB+9VmAf+NrfmorPYDL/24o8n1R7tk= mabe@utility.mabe.com",
    "clusters": [
      {
        "clusterName": "sno1",
        "networkType": "OVNKubernetes",
        "clusterLabels": {
          "du-profile": "v4.10",
          "common": true,
          "group-du-sno": "",
          "sites": "sno1"
        },
        "clusterNetwork": [
          {
            "cidr": "10.128.0.0/14",
            "hostPrefix": 23
          }
        ],
        "machineNetwork": [
          {
            "cidr": "192.168.1.0/24"
          }
        ],
        "serviceNetwork": [
          "172.30.0.0/16"
        ],
        "additionalNTPSources": [
          "clock.redhat.com"
        ],
        "ignitionConfigOverride": "{\"ignition\":{\"version\":\"3.2.0\"},\"passwd\":{\"users\":[{\"name\":\"core\",\"passwordHash\":\"$6$AMb00Izb98UzzDII$nTsI8Q3264XOFa.D15WDajrM.4P1LtWLsH2eYYGbnQvl8jswtzfyYsv46WfzSJnAeZ4j1swrBhlYitPQSYlV01\"}]}}",
        "nodes": [
          {
            "hostName": "sno1.cotton.blue",
            "role": "master",
            "bmcAddress": "redfish-virtualmedia://fakefish-192-168-1-62-fakefish.apps.hub.cotton.blue/redfish/v1/Systems/1",
            "bmcCredentialsName": {
              "name": "sno-bmc-secret"
            },
            "bootMACAddress": "70:10:6f:4f:ee:c4",
            "bootMode": "UEFI",
            "rootDeviceHints": {
              "deviceName": "/dev/sda"
            },
            "nodeNetwork": {
              "interfaces": [
                {
                  "name": "ens1s0",
                  "macAddress": "70:10:6f:4f:ee:c4"
                }
              ],
              "config": {
                "interfaces": [
                  {
                    "name": "ens1s0",
                    "type": "ethernet",
                    "state": "up",
                    "ipv4": {
                      "enabled": true,
                      "dhcp": false,
                      "address": [
                        {
                          "ip": "192.168.1.170",
                          "prefix-length": 24
                        }
                      ]
                    }
                  }
                ],
                "dns-resolver": {
                  "config": {
                    "search": [
                      "cotton.blue"
                    ],
                    "server": [
                      "192.168.1.1"
                    ]
                  }
                },
                "routes": {
                  "config": [
                    {
                      "destination": "0.0.0.0/0",
                      "next-hop-interface": "ens1s0",
                      "next-hop-address": "192.168.1.1",
                      "table-id": 254
                    }
                  ]
                }
              }
            }
          }
        ]
      }
    ]
  }
}