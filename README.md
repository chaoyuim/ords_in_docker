# ords_in_docker
dockerize your ords server

Download jdk11 rpm from here


https://www.oracle.com/nl/java/technologies/javase/jdk11-archive-downloads.html#license-lightbox


Linux x64 RPM Package	145.03 MB	jdk-11.0.17_linux-x64_bin.rpm

--------------------------------------------------------
place jdk-11.0.17_linux-x64_bin.rpm file in the same folder
--------------------------------------------------------
In the config_ords.sh file remember to change 
YOURPASSFORSYS and 
YOURPASSFORORDS_PUBLIC_USER
to your own settings.
-----------------------------------------------------------
In the tnsnames.ora file , remeber to change the HOSTIP
-----------------------------------------------------------
once done, 
To Build

docker build -t my_ords:1.0.0 .

To Run

docker run -d -p 8080:8080 my_ords:1.0.0
