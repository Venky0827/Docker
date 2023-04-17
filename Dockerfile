FROM ubuntu:22.04
LABEL Owner="anandbandari@gmail.com"
ENV ACCEPT_EULA=y
ENV SA_PASSWORD=India@123
RUN apt update && apt install -y nginx net-tools
RUN ip=$(echo "container ip : $(ifconfig | grep -h inet | sed 's/^ *//' | cut -d " " -f 2 | head -1)") && sed "s/nginx/$ip/" /usr/share/nginx/html/index.html > /var/www/html/index.html
