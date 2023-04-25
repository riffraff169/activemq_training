### Monitoring

  * Get hawtio
    * `wget https://repo1.maven.org/maven2/io/hawt/hawtio-app/2.16.3/hawtio-app-2.16.3.jar`
  * Start hawtio
    * `java -jar hawtio-app-2.16.3.jar `
  * View console
    * http://<ip>:8080/hawtio
  * Add a connection
    * Click Add Connection
    * Fill in name, use activemq
    * Scheme http
    * Host localhost
    * Port default
    * Path default
    * Test connection, should succeed
    * Click Add
  * Click Connect
    * Should open a new window (or tab)