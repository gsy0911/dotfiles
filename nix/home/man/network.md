# nslookup

```
nslookup -type=ns [domain]
nslookup -type=a [domain]
nslookup -debug -q=mx [domain]  # check TTL
```

# traceroute

```
traceroute [IP]
```

# aliases

- `ip {domain}`: `dig +short myip.opendns.com @resolver1.opendns.com`
- `localip`: `ipconfig getifaddr en0`
