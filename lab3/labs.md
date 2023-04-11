### Network of brokers
  * Stop broker1
  	* `broker1/bin/broker1 stop`
  * Copy new config to broker1
  	* `cp ~/activemq-labs/lab3/broker1/activemq1.xml broker1/conf/activemq.xml`
  * Start broker1
  	* `broker1/bin/broker1 start`
  * Connect 2 consumers, one to each
  	* `broker1/bin/broker1 consumer --destination queue://my.queue --brokerUrl tcp://localhost:61616`
  	* `broker2/bin/broker2 consumer --destination queue://my.queue --brokerUrl tcp://localhost:61617`
  * Send messages to queue
  	* `amqutil produce 2 -d my.queue`
  * Notice messages are spread among both consumers
  * Messages were sent to broker1
  * This may not be optimal depending on how far away remote broker is
  * May want messages to be delivered to nearest consumer
  * Send messages multiple times to see
  * Stop consumer1, CTRL-C
  * Stop broker1
  	* `broker1/bin/broker1 stop`
  * Copy new config with different options
  	* `cp ~/activemq-labs/lab3/broker1/activemq2.xml broker1/conf/activemq.xml`
  * Start broker1
  	* `broker1/bin/broker1 start`
  * Start consumer
  	* `broker1/bin/broker1 consumer --destination queue://my.queue --brokerUrl tcp://localhost:61616`
  * Send messages
  	* `amqutil produce 2 -d my.queue`
  * Notice all messages are now consumed by consumer1
  * Quit consumer1
  * Send more messages
  * All messages are consumed by consumer2 now
  * Start consumer1
  * Quit consumer2
  * Send more messages
  * Notice that messages will be consumed by 1 if connected, otherwise 2
  * Look in console, view queues, select my.queue, view consumers
  * Notice the active consumers
