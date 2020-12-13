# Ldapsearch Commands

### User Search
```bash
ldapsearch -LLL -x -H ldap://ldap.domain.com -D "admin@domain.com" -w Password123 -b dc=domain,dc=com sAMAccountName=danmin memberOf
```

### User Search (Nested Lookup using OID)
```bash
ldapsearch -LLL -x -H ldap://ldap.domain.com -D "admin@domain.com" -w Password123 -b dc=domain,dc=com "(&(objectClass=user)(memberOf:1.2.840.113556.1.4.1941:=cn=Domain Admins,cn=users,dc=domainm,dc=com))" sAMAccountName | grep sAMAccountName | cut -d: -f 2
```

### Admin-Count
```bash
ldapsearch -LLL -x -H ldap://ldap.domain.com -D "admin@domain.com" -w Password123 -b dc=domain,dc=com "adminCount=1" dn
```

### User Object Search with SPN (Kerberoasting)
```bash
ldapsearch -LLL -x -H ldap://ldap.domain.com -D "admin@domain.com" -w Password123 -b dc=domain,dc=com "(&(&(servicePrincipalName=*)(UserAccountControl:1.2.84011356.1.4.803:=512))(!(UserAccountControl:1.2.840.113556.1.4.803:=2)))"
```

### User and Computer Search with Unconstratined Delegation
```bash
ldapsearch -LLL -x -H ldap://ldap.domain.com -D "admin@domain.com" -w Password123 -b dc=domain,dc=com "(&(&(objectCategory=person)(objectClass=user))(userAccountControl:1.2.840.113556.1.4.803:=524288))"

ldapsearch -LLL -x -H ldap://ldap.domain.com -D "admin@domain.com" -w Password123 -b dc=domain,dc=com "(&(objectCategory=computer)(objectClass=computer)(userAccountControl:1.2.840.113556.1.4.803:=524288))"
```