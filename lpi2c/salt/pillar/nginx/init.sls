vhost:
  -
    {% if salt['grains.get']('domain') == 'theforce.local' %}
    server_name: 
      - theforce.local 
      - www.theforce.local
    dst_host: luke.theforce.local
    {% elif salt['grains.get']('domain') == 'darkside.local' %}
    server_name: 
      - darkside.local
      - www.darkside.local
    dst_host: darthvader.theforce.local
    {% endif %}
    