### Network of brokers
  * Copy configs
    * `cp ~/activemq_training/03_Network_Of_Brokers/broker1/activemq.xml broker1/conf`
    * `cp ~/activemq_training/03_Network_Of_Brokers/broker2/activemq.xml broker2/conf`
  * Restart both activemq brokers
	* `broker1/bin/broker1 restart`
	* `broker2/bin/broker2 restart`
  * Send messages to queue
	* `amqutil produce 20 -d my.queue`
  * Look on consoles to see queues:
	* Queue my.queue is present on broker1 with 20 messages
	* Queue does not exist on broker2
  * List queues on broker1 and broker2
	* `amqutil list`
	* `amqutil list --port 61617`
	* Notice queue isn't present on broker2
  * Browse queues on broker1 and broker2
	* `amqutil browse -d my.queue`
	* `amqutil browse --port 61617 -d my.queue`
	* Notice queue isn't present on broker2, no messages are listed
  * Consume a message from broker1
	* `amqutil count -d my.queue`
  		* Should say "Messages on my.queue: 20"
	* `amqutil consume -d my.queue`
	* `amqutil count -d my.queue`
  		* Should say "Messages on my.queue: 19"
  * Consume a message from broker2
	* `amqutil count --port 61617 -d my.queue`
  		* Should say "Messages on my.queue: 0"
	* `amqutil consume --port 61617 -d my.queue`
	* `amqutil count --port 61617 -d my.queue`
  		* Should say "Messages on my.queue: 18"
  * View queue on broker1
	* `amqutil count -d my.queue`
  		* Should say "Messages on my.queue: 0"
  * Once a consumer connects to consume a message from broker2, all messages have been transfered to broker2
  * Messages are no longer available on broker1
  * Put more messages in queue on broker1
	* `amqutil produce 20 -d my.queue`
	* `amqutil count -d my.queue`
	* `amqutil count --port 61617 -d my.queue`
  * Consume from broker1
	* `amqutil consume -d my.queue`
  		* You can now consume some messages from my.queue, but only the messages that are still on broker1
	* `amqutil count -d my.queue`
	* `amqutil count --port 61617 -d broker2`
  		* Some messages on broker1, some on broker2
  * Consume from broker2
	* `amqutil consume --port 61617 -d my.queue`
  * Now count on broker1 and broker2 again
	* `amqutil count -d my.queue`
	* `amqutil count --port 61617 -d my.queue`
  * Notice all messages are now on broker2, none on broker1
  * As soon as a consumer connects to broker2 to consume messages, messages are no longer available on broker1
  * With this configuration, there isn't true load balancing
  * It really is 1 active broker at a time, with a possible out-of-order consumption of messages if a consumer connects to broker1 before another connects and consumes from broker2.
