# Usamos Debian Wheezy como base por su cercanía a Squeeze
FROM debian:wheezy

# Evita interacciones durante la instalación de paquetes
ARG DEBIAN_FRONTEND=noninteractive

# Cambia los repositorios a los archivados
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i '/wheezy-updates/d' /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until false;' > /etc/apt/apt.conf.d/99no-check-valid

# Actualiza e instala herramientas de compilación y bibliotecas de 32 bits
RUN apt-get update --allow-unauthenticated && \
    apt-get install -y --no-install-recommends --allow-unauthenticated \
    gcc-multilib g++-multilib make

# Configura el directorio de trabajo
WORKDIR /src

# Asegúrate de ajustar esta línea para que coincida con la estructura de tu directorio.
COPY ./data/40611.c /src/
RUN gcc -m32 -pthread -o exploit 40611.c
