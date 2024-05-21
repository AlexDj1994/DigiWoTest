@echo off
docker build -t demo-site-image .
docker run -d -t -p 81:80 --name demo-site-container demo-site-image
