### Combination Network and Master/Slave brokers
  * Create new broker
    * `bin/activemq create broker3`
  * Copy configs
    * `cp ~/activemq_training/lab6/broker1/activemq.xml broker1/conf/activemq.xml`
    * `cp ~/activemq_training/lab6/broker2/activemq.xml broker2/conf/activemq.xml`
    * ` cp ~/activemq_training/lab6/broker3/activemq.xml broker3/conf/activemq.xml`
  * Restart brokers
    * `broker1/bin/broker1 restart`
    * `broker2/bin/broker2 restart`
    * `broker3/bin/broker3 start`