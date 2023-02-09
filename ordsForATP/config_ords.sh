
ORDS_CONFIG_DIR=/opt/oracle/ords/config && mkdir -p $ORDS_CONFIG_DIR/ords/conf

ORDS_USER=CUSTOM_ORDS_PUBLIC_USER
ORDS_PASSWORD=$1
SERVICE_NAME=$2
WALLET_BASE64=`base64 -w 0 /tmp/Wallet*.zip`


cat << EOF > $ORDS_CONFIG_DIR/ords/conf/apex_pu.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
  <entry key="db.username">$ORDS_USER</entry>
  <entry key="db.password">!$ORDS_PASSWORD</entry>
  <entry key="db.wallet.zip.service">$SERVICE_NAME</entry>
  <entry key="db.wallet.zip"><![CDATA[$WALLET_BASE64]]></entry>
</properties>
EOF

cat << EOF > $ORDS_CONFIG_DIR/ords/defaults.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
  <entry key="plsql.gateway.enabled">true</entry>
  <entry key="jdbc.InitialLimit">5</entry>
  <entry key="jdbc.MaxLimit">10</entry>
</properties>
EOF
