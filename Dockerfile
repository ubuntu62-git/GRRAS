FROM ubuntu

MAINTAINER  linaghormade123@gmail.com

RUN docker build -t linahub/pipelineimage1

WORKDIR /GRRAS

RUN docker run -it -d --name=container-pipeline linahub/pipelineimage1 /bin/bash

EXPOSE 90

COPY index.html /var/www/html

ADD /home/lina/Documents/extract_tar_files/apache-maven-3.9.6/bin/mvn install /GRRAS
ADD cp target/GRRAS.war /home/lina/Documents/extract_tar_files/apache-tomcat-9.0.85

ENTRYPOINT service ssh start && bash

