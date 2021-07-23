#!/usr/bin/env python3
# -*- Coding: UTF-8 -*-

import sys
from faker import Faker
from faker_job_brazil import BrazilJobProvider
from faker_extras.human import HumanProvider
from random import randint
from pwgen import pwgen

f = Faker()
f.add_provider(BrazilJobProvider)
f.add_provider(HumanProvider)

OUs = ['Recursos Humanos', 'Engenharia', 'Tecnologia da Informação', 'Diretoria', 'Conselho', 'Marketing', 'Vendas']
domain = 'darkside'

for ou in OUs:
    print(f"""
dn: OU={ou},DC={domain},DC=local
objectClass: top
objectClass: organizationalUnit
ou: {ou}
distinguishedName: OU={ou},DC={domain},DC=local
name: {ou}
    """)

i = 0

uids = []
for i in range(0, 100):
    first_name = f.first_name()
    surname = f.last_name()
    phone = f.phone_number()
    email = "{}.{}@theforce.local".format(first_name.lower(), surname.lower())
    ou = OUs[randint(0, 6)]
    dn = f"cn={first_name} {surname},ou={ou},dc=theforce,dc=local"
    uid = "{}{}".format(first_name[0], surname)
    password = pwgen(10)
    description = f.catch_phrase()

    if uid in uids:
        pass
    else:
        print(f"""
dn: cn={first_name} {surname},ou={ou},dc={domain},dc=local
objectclass: inetOrgPerson
cn: {first_name} {surname}
sn: {surname}
uid: {uid.lower()}
userpassword: {password}
homephone: {phone}
mail: {email}
description: {description}
ou: {ou}
""")
