base:
  '*':
    - packages
    - ntp
  'G@role:router':
    - firewall
    - nginx
    - openldap.server
    - openldap.client
    - nfs.server
  'G@role:client':
    - openldap.client
    - nfs.client
    