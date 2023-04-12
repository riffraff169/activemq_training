### Users
 * Copy new config with users defined
    * `cp ~/activemq-labs/lab4/broker1/activemq1.xml broker1/conf/activemq.xml`
    * View config file with less
    * Notice users section at the bottom with `<plugin></plugin>`
 * Restart broker1
    * `broker1/bin/broker1 restart`
 * Try to send messages
    * `amqutil produce 5 -d my.queue`
 * Error message
    * User name [admin] or password is invalid
 * Need to provide username
    * `amqutil produce 5 -d my.queue --user publisher --password password`
 * Success!
 * Now to consume
    * `amqutil consume -d my.queue`
 * Oops, same error
    * `amqutil consume -d my.queue -u consumer -p password`
   
### Brokers
  * Look at log
     * `less broker1/data/activemq.log`
  * Log entry similar to `Stopping vm://broker1#104 because Failed with SecurityException: User name [null] or password is invalid.`
  * Need to change config to add username/password
    * `cp ~/activemq-libs/lab4/broker2/activemq.xml broker2/conf/activemq.xml`
    * `cp ~/activemq-libs/lab4/broker1/activemq2.xml broker1/conf/activemq.xml`
  * Restart both brokers
    * `broker1/bin/broker1 restart`
    * `broker2/bin/broker2 restart`
  * Publish some messages
    * `amqutil produce 5 -d my.queue -u publisher -p password`
  * Get messages on both broker1 and broker2
    * `amqutil consume -d my.queue -u consumer -p password`
    * `amqutil consume --port 61617 -d my.queue -u consumer -p password`
