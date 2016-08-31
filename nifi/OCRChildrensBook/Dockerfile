FROM jdye64/nifi:0.6.1
MAINTAINER Jeremy Dyer

RUN apt-get update

# Install Tesseract Dependencies
RUN apt-get install -y unzip ant git wget build-essential cmake libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev curl python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev autoconf automake libtool libicu-dev vim

# Install required version of leptonica
RUN wget http://www.leptonica.org/source/leptonica-1.73.tar.gz && tar -xzvf leptonica-1.73.tar.gz && cd leptonica-1.73 && ./configure && make && make install
RUN rm leptonica-1.73.tar.gz

RUN git clone https://github.com/tesseract-ocr/tesseract.git
RUN cd tesseract && ./autogen.sh && ./configure && LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make && make install && ldconfig

# Installs the Tesseract english language support
#RUN wget https://github.com/tesseract-ocr/tesseract/archive/3.01.tar.gz
#RUN tar -xzvf 3.01.tar.gz
#RUN mv /tesseract-3.01/tessdata/* /usr/local/share/tessdata/.

# Clones jdye64 nifi-addons repo which contains a list of several useful NiFi processors
RUN git clone https://github.com/jdye64/nifi-addons.git

# Build the "nifi-ocr" custom processor and add to local installation
RUN cd nifi-addons/Processors/nifi-ocr/nifi-ocr-processors && mvn clean install package -DskipTests

RUN cd / && ls -l
RUN pwd && ls -l
RUN cd /nifi-addons/nifi-ocr/nifi-ocr-nar/target/ && ls -l
RUN cp /nifi-addons/nifi-ocr/nifi-ocr-nar/target/nifi-ocr-nar-0.7.0.nar $NIFI_HOME/lib

# Adds the demo assets
ADD InputAssets /Input
ADD flow.xml.gz $NIFI_HOME/conf