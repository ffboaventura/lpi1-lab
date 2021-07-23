nfs:
  server:
    enabled: true
    share:
      data_vfs:
        path: /data/vfs
        host:
          dside:
            host: 172.18.2.0/30
            params:
            - rw
            - no_root_squash
            - sync
          tforce:
            host: 172.17.15.0/24
            params:
            - rw
            - no_root_squash
            - sync
  client:
    enabled: true
    mount:
      samba1:
        path: /data/samba
        fstype: nfs
        {% if grains['domain'] == 'darkside.local' %}
        device: 172.18.2.1:/data/vfs
        {% elif grains['domain'] == 'theforce.local' %}
        device: 172.18.2.1:/data/vfs
        {% endif %}
        opts: "ro,user"