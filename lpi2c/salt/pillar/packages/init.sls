common_packages:
  {% if grains['os'] == 'Ubuntu' %}
  vim:
    - pkg: vim
  conntrack: []
  netcat: []
  dnsutils: []
  {% elif grains['os'] == 'CentOS' %}
  vim:
    - pkg: vim-enhaced
  epel-release: []
  centos-release: []
  conntrack-tools: []
  nmap-ncat: []
  net-tools: []
  {% endif %}
  tmux: []
  screen: []
  bash: []
  zsh: []
  fping: []
  traceroute: []
  tcpdump: []
  ntpdate: []
  git: []
  ipset: []
  wget: []
  curl: []

to_remove:
  {% if grains['role'] == 'router' %}
  {% if grains['os'] == 'CentOS' %}
  httpd: []
  {% elif grains['os'] == 'Ubuntu' %}
  apache2: []
  {% endif %}
  {% elif grains['role'] == 'client' %}
  []
  {% endif %}
  nagios:
