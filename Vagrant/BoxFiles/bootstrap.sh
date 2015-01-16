#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y install raptor2-utils
sudo apt-get -y install wget
sudo apt-get -y install curl
sudo apt-get -y install unzip
sudo apt-get -y install openjdk-7-jdk
sudo apt-get -y install git
sudo apt-get -y install python
sudo apt-get install python-pip
pip install PyGithub
export LC_ALL=en_US.UTF-8
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
echo "export LC_ALL=en_US.UTF-8" >> .bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/" >> .bashrc
echo "export JENAROOT=/usr/local/bin/apache-jena-2.12.0" >> .bashrc
echo "export PATH=$PATH:/usr/local/bin/provToolbox/bin:/usr/local/bin/apache-jena-2.12.0/bin" >> .bashrc
echo "update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java" >> .bashrc
curl -O http://apache.websitebeheerjd.nl//jena/binaries/apache-jena-2.12.1.zip  
unzip apache-jena-2.12.1.zip
curl -O https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.17.zip
unzip google_appengine_1.9.17.zip
git clone https://github.com/rvguha/schemaorg.git
git clone https://github.com/mobivoc/mobivoc.git
git clone https://github.com/mobivoc/vocol.git
sudo sudo mv apache-jena-2.12.1/lib/* vocol/HtmlGenerator/src/
cd vocol/HtmlGenerator/src/
sudo javac -cp .:jena-arq-2.12.1.jar:jena-core-2.12.1.jar:jena-iri-1.1.1.jar:log4j-1.2.17.jar:slf4j-api-1.7.6.jar:xercesImpl-2.11.0.jar:xml-apis-1.4.01.jar HtmlGenerator.java
sudo java -cp .:jena-arq-2.12.1.jar:jena-core-2.12.1.jar:jena-iri-1.1.1.jar:log4j-1.2.17.jar:slf4j-api-1.7.6.jar:xercesImpl-2.11.0.jar:xml-apis-1.4.01.jar HtmlGenerator /home/vagrant/mobivoc/ChargingPoints.ttl /home/vagrant/schemaorg/data/schema.rdfa //home/vagrant/vocol/HtmlGenerator/Templates/template.html /home/vagrant/schemaorg/data/schemas.html /home/vagrant/vocol/HtmlGenerator/Templates/schemasTemplate.html
cd /home/vagrant/google_appengine/
./dev_appserver.py /home/vagrant/schemaorg/app.yaml

