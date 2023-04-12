{
  "type": "CLUSTER_CREATE",
  "mode": "COMPACT",
  "request_id": "9d1b6e4f-f710-4745-a1ab-3b2215c842cd",
  "clusters": [
    {
      "cluster_name": "cluster4",
      "ocp_version": "4.10.52",
      "cluster_labels": {
        "common": true,
        "du-profile": "v4.10",
        "group-du-sno": null,
        "sites": "cluster4"
      },
      "base_domain": "lab.example.com",
      "ssh_pubkey": "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC6J7nhSgR/mYTBB+QH/6gShkvKkTWhWDhNGVi1PhVkF ztphub",
      "pull_secret": "pull-secret",
      "api_vip": "172.25.181.13",
      "ingress_vip": "172.25.181.14",
      "machine_network": "172.25.181.0/27",
      "nodes": [
        {
          "role": "CONTROLLER",
          "hostname": "atlztp02",
          "networks": [
            {
              "ip": "172.25.181.7/27",
              "mac": "b4:45:06:f2:6f:c1",
              "target": "idrac",
              "routes": [
                {
                  "net": "0.0.0.0",
                  "gw": "172.25.181.1"
                }
              ],
              "enabled": true,
              "dhcp": true
            },
            {
              "ip": "172.25.181.8/27",
              "mac": "b4:45:06:f1:c6:8b",
              "int_name": "emb1p1",
              "target": "primary",
              "routes": [
                {
                  "net": "0.0.0.0",
                  "gw": "172.25.181.1"
                }
              ],
              "enabled": true,
              "dhcp": false
            },
            {
              "mac": "D0:8E:79:F3:64:1F",
              "int_name": "emb2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:EB:FF:10",
              "int_name": "int1p1",
              "target": "secondary",
              "enabled": true,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:EB:FF:11",
              "int_name": "int2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:DA:C7:F4",
              "int_name": "slot5p1p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:DA:C7:F5",
              "int_name": "slot5p2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:DA:C7:F6",
              "int_name": "slot5p3p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:DA:C7:F7",
              "int_name": "slot5p4p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            }
          ],
          "installation_disk": "/dev/sda",
          "idrac_user": "dhcpd",
          "idrac_password": "Dell@0ss!"
        },
        {
          "role": "CONTROLLER",
          "hostname": "atlztp03",
          "networks": [
            {
              "ip": "172.25.181.9/27",
              "mac": "ec:2a:72:43:de:9a",
              "target": "idrac",
              "routes": [
                {
                  "net": "0.0.0.0",
                  "gw": "172.25.181.1"
                }
              ],
              "enabled": true,
              "dhcp": true
            },
            {
              "ip": "172.25.181.10/27",
              "mac": "ec:2a:72:50:f0:58",
              "int_name": "emb1p1",
              "target": "primary",
              "routes": [
                {
                  "net": "0.0.0.0",
                  "gw": "172.25.181.1"
                }
              ],
              "enabled": true,
              "dhcp": false
            },
            {
              "mac": "D0:8E:79:F6:D9:F3",
              "int_name": "emb2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:EC:10:9C",
              "int_name": "int1p1",
              "target": "secondary",
              "enabled": true,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:EC:10:9D",
              "int_name": "int2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:D9:01:08",
              "int_name": "slot5p1p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:D9:01:09",
              "int_name": "slot5p2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:D9:01:0A",
              "int_name": "slot5p3p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:D9:01:0B",
              "int_name": "slot5p4p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            }
          ],
          "installation_disk": "/dev/sda",
          "idrac_user": "dhcpd",
          "idrac_password": "Dell@0ss!"
        },
        {
          "role": "CONTROLLER",
          "hostname": "atlztp04",
          "networks": [
            {
              "ip": "172.25.181.21/27",
              "mac": "b4:45:06:f2:70:81",
              "target": "idrac",
              "routes": [
                {
                  "net": "0.0.0.0",
                  "gw": "172.25.181.1"
                }
              ],
              "enabled": true,
              "dhcp": true
            },
            {
              "ip": "172.25.181.20/27",
              "mac": "b4:45:06:f1:c9:e5",
              "int_name": "emb1p1",
              "target": "primary",
              "routes": [
                {
                  "net": "0.0.0.0",
                  "gw": "172.25.181.1"
                }
              ],
              "enabled": true,
              "dhcp": false
            },
            {
              "mac": "b0:7b:25:d4:2c:31",
              "int_name": "emb2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:BE:B1:C8",
              "int_name": "int1p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "B4:96:91:BE:B1:C9",
              "int_name": "int2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "04:3F:72:FE:DC:E8",
              "int_name": "slot5p1p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "04:3F:72:FE:DC:E9",
              "int_name": "slot5p2p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "04:3F:72:FE:DC:E0",
              "int_name": "slot5p3p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            },
            {
              "mac": "04:3F:72:FE:DC:E1",
              "int_name": "slot5p4p1",
              "target": "secondary",
              "enabled": false,
              "dhcp": false
            }
          ],
          "installation_disk": "/dev/sda",
          "idrac_user": "dhcpd",
          "idrac_password": "Dell@0ss!"
        }
      ],
      "dns_servers": [
        "192.168.50.92"
      ],
      "dns_search": [
        "lab.example.com"
      ],
      "ntp_servers": [
        "192.168.50.92"
      ]
    }
  ]
}