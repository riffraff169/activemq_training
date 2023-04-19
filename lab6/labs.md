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
  * Send messages to queue
    * `amqutil produce 5 -d my.queue`
  * Get message from broker1
    * `amqutil consume -d my.queue`
  * Get message from broker3
    * `amqutil consume --port 61618 -d my.queue`
  * Look at console, notice all messages have moved to broker3
  * Get message from broker1
    * Just waits, because all messages are on broker3
  * Send messages to broker3
    * `amqutil produce 5 --port 61618 -d my.queue`
  * Consume from broker1
    * `amqutil consume -d my.queue`
  * New messages on broker3 get sent to broker1
    Messages that were originally on broker1 that were sent to broker3, stay on broker3