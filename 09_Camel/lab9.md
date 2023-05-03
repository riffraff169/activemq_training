### Camel
  * Shutdown old brokers
    * `broker1/bin/broker1 stop`
    * `broker2/bin/broker2 stop`
    * `broker3/bin/broker3 stop`
  * Set up example camel configs
    * `cp ~/activemq_training/09_Camel/broker1/activemq.xml broker1/conf/`
    * `cp ~/activemq_training/09_Camel/broker1/camel.xml broker1/conf/`
  * Add activemq-camel library
    * `cp ~/activemq_training/09_Camel/jars/*.jar lib/`
  * Start broker1
    * `broker1/bin/broker1 start`

This example just watches the topic Test.Topic and reroutes all messages to the queue Test.Queue

  * Send messages to Test.Topic
    * `amqutil publish 5 -d Test.Topic`
  * View console and see where messages are
    * They have been moved to the queue Test.Queue
  * Get messages
    * `amqutil consume -d Test.Queue`


  * Add another route
    * `cp ~/activemq_training/09_Camel/broker1/camel2.xml broker1/conf/camel.xml`
  * View queue and consume messages

There are a lot of different rules that camel provides that can do many different things to messages.
This is just a simple embedded camel example, it is not recommended. Running camel separate as part of an application that uses activemq, or with Camel-K or Quarkus is better.
