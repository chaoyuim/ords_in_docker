# ords_in_docker
dockerize your ords server For Both XE and ATP in OCI

For XE, you need 
- JDK11
- tnsnames.ora
- password for sys 
- password for ORDS_PUBLIC_USER

Download jdk-11.0.17_linux-x64_bin.rpm from here https://www.oracle.com/nl/java/technologies/javase/jdk11-archive-downloads.html#license-lightbox
place both tnsnames.ora and jdk*.rpm in the same folder ords4

In the config_ords.sh file remember to change 
YOURPASSFORSYS and 
YOURPASSFORORDS_PUBLIC_USER
to your own settings.

In the tnsnames.ora file , remeber to change the YOURHOSTID

once done, 
To Build

docker build -t my_ords:1.0.0 .

To Run

docker run -d -p 8080:8080 my_ords:1.0.0
