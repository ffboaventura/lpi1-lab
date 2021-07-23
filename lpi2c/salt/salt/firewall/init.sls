
{% if grains['os'] == 'CentOS' %}
firewalld:
{% elif grains['os'] == 'Ubuntu' %}
ufw:
{% endif %}
  service.dead:
    - enable: False
    - reload: False

/etc/fw:
    file.directory:
        - user: root
        - group: root
        - mode: 755
        - makedirs: True
        - recurse:
          - user
          - group
          - mode

/etc/fw/firewall.sh:
  file.managed:
    - source: salt://firewall/firewall.j2
    - template: jinja
    - mode: 755
    - user: root
    - group: root
  cron.present:
    - user: root
    - special: '@reboot'
