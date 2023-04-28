### Combination Network and Master/Slave brokers
  * Create new broker
    * `bin/activemq create broker3`
  * Copy configs
    * `cp ~/activemq_training/05_Combination_Of_Brokers/broker1/activemq.xml broker1/conf/activemq.xml`
    * `cp ~/activemq_training/05_Combination_Of_Brokers/broker2/activemq.xml broker2/conf/activemq.xml`
    * `cp ~/activemq_training/05_Combination_Of_Brokers/broker3/activemq.xml broker3/conf/activemq.xml`
    * `cp ~/activemq_training/05_Combination_Of_Brokers/broker3/jetty.xml broker3/conf/jetty.xml`
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
    Messages that were originally on broker1 that were sent to broker3, won't move back to broker1
  * To limit how many messages move over to other broker, set prefetchSize in network connector

### Demonstrate prefetch
  * Add `prefetchSize=1` to network connector parameters in broker1
  * Send messages to queue
    * `amqutil produce 10 -d my.queue2`
  * Get a message from broker1
    * `amqutil consume -d my.queue2`
  * Get a message from broker3
    * `amqutil consume -d my.queue2 --port 61618`
  * View consoles on broker1 and broker3
    * Notice that only 2 messages moved from broker1 to broker3
    One was received, the other is still in the queue
    The rest of the messages are still on broker1
  * Repeat to see how it works
