# Containerfile to build an Apache web server image for a website template.

FROM amazonlinux:latest

RUN yum install -y httpd zip unzip && yum clean all

WORKDIR /var/www/html

ADD https://templated.live/hielo/download/hielo.zip /tmp/hielo.zip
RUN unzip /tmp/hielo.zip -d /var/www/html && rm -f /tmp/hielo.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
