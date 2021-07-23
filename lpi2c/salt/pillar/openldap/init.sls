{% if grains['domain'] == 'theforce.local' %}
{% set base='dc=theforce,dc=local' %}
{% elif grains['domain'] == 'darkside.local' %}
{% set base='dc=darkside,dc=local' %}
{% else %}
{% set base='dc=nonono,dc=local' %}

{% endif %}

openldap:
    rootdn: cn=admin,{{ base }}
    rootpw: '{SSHA}XkCAqfxH1TDjpO2HTfTT8wKpuLTacBnb'
    base: {{ base }}
    uri: ldap://{{ grains['domain'] }}
#    slapd_conf: '/etc/ldap/slapd.conf' # if no dynamic configuration on Debian
    user: 'openldap'
    group: 'openldap'
#    slapd_services: 'ldap:/// ldaps:/// ldapi:///'
#    slapd_options: '-4' # add other options here if needed
    lookup:
      index: objectClass
