FROM ubuntu:latest

#Install Python,setup tools & Genshi

RUN apt-get update -y && \
	apt-get install -y python && \
	apt-get install -y python-pip && \
	pip install Genshi && \
	easy_install http://download.edgewall.org/trac/Trac-latest-dev.tar.gz 
	
	
CMD mkdir /opt/SampleProject1
CMD chmod 755 /opt/SampleProject1
CMD trac-admin /opt/SampleProject1 initenv
	
CMD tracd --port 8043 /opt/SampleProject1

EXPOSE 8044
#docker run -d -p 8044:8043 <containerid>
#
#
