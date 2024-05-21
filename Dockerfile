# Gebruik de bestaande “ubuntu”-image (tag: 20.04)
FROM ubuntu:20.04

# Update de apt package lists
RUN apt update

# Zorg dat er geen interactieve prompts zijn tijdens de installatie
ENV DEBIAN_FRONTEND=noninteractive

# Installeer Apache en PHP
RUN apt install -y apache2
RUN apt install -y php

# Kopieer de inhoud van “html” (op de host) naar “/var/www/html” (in de image)
COPY html /var/www/html/

# Werkdirectory instellen
WORKDIR /var/www/html/

# Expose poort 81 (TCP)
EXPOSE 81/tcp

# Maak het bestand “buildtime.txt” aan met de buildtijd
RUN date > /var/www/html/buildtime.txt

# Start Apache en blijf in bash
CMD service apache2 start && bash
