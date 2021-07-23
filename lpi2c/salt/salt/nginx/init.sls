/etc/nginx/nginx.conf:
    file.managed:
        - source: salt://nginx/{{ grains['os'] }}/nginx.conf
        - user: root
        - group: root
        - mode: 644

/etc/nginx/conf.d/z-001-www.conf:
    file.managed:
        - user: root
        - group: root
        - mode: 644
        - source: salt://nginx/vhost.j2
        - template: jinja

nginx:
    pkg:
      - installed
    service.running:
      - enable: true
      - watch:
        - pkg: nginx
        - file: /etc/nginx/nginx.conf
        - file: /etc/nginx/conf.d/*.conf

