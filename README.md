# ords_in_docker
dockerize your ords server For Both XE and ATP in OCI

For XE, you need 
- JDK11
- tnsnames.ora
- password for sys 
- password for ORDS_PUBLIC_USER

To do:
- Download jdk-11.0.17_linux-x64_bin.rpm from here https://www.oracle.com/nl/java/technologies/javase/jdk11-archive-downloads.html#license-lightbox
- place both tnsnames.ora and jdk*.rpm in the same folder ords4xe
- In the config_ords.sh file remember to change YOURPASSFORSYS and YOURPASSFORORDS_PUBLIC_USER to your own settings.
- In the tnsnames.ora file , remeber to change the YOURHOSTID

To Build:
docker build -t my_ords:1.0.0 .

To Run:
docker run -d -p 8080:8080 my_ords:1.0.0

For ATP, you need 
- JDK11
- create CUSTOM_ORDS_PUBLIC_USER, grant connect and provision_runtime_role (read here https://wordpress.chaoyu.nl/?p=810 )
- set CDN image location  (read here https://wordpress.chaoyu.nl/?p=810 )
      -- 1. Create the database user.
      create user custom_ords_public_user identified by YOURPASSWORD;
      -- 2. Allow the user to connect to the database.
      grant connect to custom_ords_public_user;
      -- 3. Perform some magic.
      begin
          ords_admin.provision_runtime_role(
              p_user => 'CUSTOM_ORDS_PUBLIC_USER'
              , p_proxy_enabled_schemas => true
          );
      end;
      /
      begin 
          apex_instance_admin.set_parameter(
              p_parameter => 'IMAGE_PREFIX',
              p_value     => 'https://static.oracle.com/cdn/apex/22.2.0/');
          commit;
        end;
      /
- 
