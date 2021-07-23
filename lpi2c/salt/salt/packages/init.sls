{% for package, args in salt['pillar.get']('common_packages', {}).items() %}
{% if args['pkg'] is defined %}
{{ args['pkg'] }}:
{% else %}
{{ package }}:
{% endif %}
  pkg.installed:
    - version: latest
{% endfor %}

{% for package, args in salt['pillar.get']('to_remove', {}).items() %}
{% if args['pkg'] is defined %}
{{ args['pkg'] }}:
{% else %}
{{ package }}:
{% endif %}
  pkg.removed
{% endfor %}
