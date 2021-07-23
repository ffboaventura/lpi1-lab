base:
  '*':
    - packages
    - openldap
    - ntp
    - nfs
  'domain:theforce.local':
    - match: grain
    - nginx.theforce
  'domain:darkside.local':
    - match: grain
    - nginx.darkside
