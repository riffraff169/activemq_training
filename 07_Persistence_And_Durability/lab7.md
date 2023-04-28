### Setup
  * Copy configs again
    * `cp ~/activemq_training/07_Persistence_And_Durability/broker1/activemq.xml broker1/conf`
    * `cp ~/activemq_training/07_Persistence_And_Durability/broker2/activemq.xml broker2/conf`
    * `cp ~/activemq_training/07_Persistence_And_Durability/broker3/activemq.xml broker3/conf`
  * Restart brokers
    * `broker1/bin/broker1 restart`
    * `broker2/bin/broker2 restart`
    * `broker3/bin/broker3 restart`

### Persistence
All queues have been declared persistent so far using the `amqutil` program. This means the messages stay in the queue if the broker stops or restarts. We will now demonstrate non-persistence.

  * Send messages to a queue without persistence
    * `amqutil produce 5 -d my.queue2 --nonpersistent`
  * View console, notice there are 5 messages on queue
  * Get a messages
    * `amqutil consume -d my.queue2`
  * View console, now there are 4 messages
  * Fail over to broker2
    * `broker1/bin/broker1 stop`
  * View broker2 console
  * Notice queue `my.queue2` exists, but no messages are in queue.
  This is because the queue was not persistent. It was held only in memory, not on disk, and when broker1 was shut down (or failed), when broker2 started it did not have any messages in the queue.
  
Non-persistence is faster because it is memory only, but messages can be lost if there is a broker failure.

### TTL
Use TTL to expire messages after a specific time period. This is used to prevent disk or memory from filling up with messages that may not be relevant after a time.

  * Send messages to queue, 5 sec (5000 msec) ttl
    * `amqutil produce 5 -d my.queue3 --ttl 5000`
  * Get 1 message
    * `amqutil consume -d my.queue3`
  * View console, refresh, wait for all messages to be dequeued
  * Try to get another message
    * `amqutil consume -d my.queue3`
    
### Durability
Durability only applies to topics. Queues are implied to be durable.

  * `amqutil publish 5 -d my.topic`
  * View console, shows messages enqueued, but not dequeued
    * Those messages are gone
  * Connect a durable subscriber
    * `amqutil subscribe 5 -d my.topic --durable client1`
  * Publish some messages
    * `amqutil publish 5 -d my.topic`
  * Client gets all 5 messages and quits
  * Publish more messages
    * `amqutil publish 5 -d my.topic`
  * View console, messages are queued
  No client to receive
  * Connect subscriber again
    * `amqutil subscribe 5 -d my.topic --durable client1`
  * It now gets the messages that were sent to the topic and held for the durable consumer
