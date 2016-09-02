FROM jdye64/docker-hwx:nifi-1.0.0
MAINTAINER Jeremy Dyer

# OpenCV required dependencies
RUN apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev curl wget

# OpenCV optional dependencies
RUN apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# Download the OpenCV source code
RUN wget https://github.com/Itseez/opencv/archive/3.1.0.zip

RUN unzip 3.1.0.zip
RUN cd opencv-3.1.0 && mkdir build && cd build && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF .. && make -j8

# Install Custom Processors
#RUN git clone https://github.com/jdye64/nifi-opencv.git

# Barcode Scanner Custom Processor
#RUN cd /nifi-opencv && mvn clean install package -DskipTests && cp ./nifi-opencv-nar/target/nifi-opencv-nar-0.6.1.nar /nifi-0.6.1/lib

# Set java.library.path for NiFi
#RUN sed -i '$ a java.arg.99=-Djava.library.path=/opencv-3.1.0/build/lib' /nifi-0.6.1/conf/bootstrap.conf

# Adds the demo assets
#ADD InputAssets /Input
#ADD flow.xml.gz $NIFI_HOME/conf

# Exposes the needed baseline ports
EXPOSE 9292
EXPOSE 9393
EXPOSE 8888

#RUN cp /nifi-0.6.1/lib/nifi-opencv*.nar $NIFI_HOME/lib/
