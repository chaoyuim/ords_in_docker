ords install --admin-user "sys as sysdba" \
             --proxy-user \
             --db-tns-dir "/opt/oracle/network/admin" \
             --db-tns-alias "XEPDB1" \
             --feature-db-api true \
             --db-pool db1 \
             --feature-sdw true \
             --feature-rest-enabled-sql true \
             --password-stdin << EOF
<YOURPASSFORSYS>
<YOURPASSFORORDS_PUBLIC_USER>
EOF
