Lo primero averiguo la version del debian:
```bash
$ cat /etc/debian_version
6.0.5
```
lo transformo a .c
```bash
┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ mv 40611 40611.c
```

Crear el docker-compose:
```D
version: '3.8'
services:
  exploit-compiler:
    image: debian:wheezy
    volumes:
      - data:/src
    working_dir: /src
    command: bash -c "apt-get update && apt-get install -y gcc-multilib g++-multilib && gcc -m32 -o exploit tu_exploit.c"

volumes:
  data:
    name: data

```

