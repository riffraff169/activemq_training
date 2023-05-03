### Monitoring

  * Get hawtio
    * `wget https://repo1.maven.org/maven2/io/hawt/hawtio-app/2.16.3/hawtio-app-2.16.3.jar`
  * Start hawtio
    * `java -jar hawtio-app-2.16.3.jar `
  * Copy new config for activemq
    * `cp ~/activemq_training/08_Metrics/broker1/broker1 broker1/bin`
  * Restart broker1
    * `broker1/bin/broker1 restart`
  * View console
    * http://<ip>:8161/hawtio/
  * Add a connection
    * Click Add Connection
    * Fill in name, use activemq
    * Scheme http
    * Host localhost
    * Port 8161
    * Path /api/jolokia/
    * Test connection, should succeed
    * Click Add
  * Click Connect
    * Should open a new window (or tab)

  * Rerun this after `09_Camel`
