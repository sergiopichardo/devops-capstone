FROM nginx 

LABEL Name="nginx" Version="v1" Color="blue"

COPY index.html /usr/share/nginx/html

EXPOSE 80
