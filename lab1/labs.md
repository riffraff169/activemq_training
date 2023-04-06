## Test
 * Create a queue
    * Click on Queues on top ribbon
    * Enter test
    * Click Create
  * Send message to queue
    * Click on Send on top ribbon
    * Select test for queue
    * Enter text in Message body
    * Click Send
  * View results
    * Click Queues on top ribbon
    * See queue test with 1 message
    * Click on queue test
    * See Message ID in list
    * Click on message id
    * See message details
  * Test client
    * `cd examples/amqp/python`
    * `dnf install -y gcc openssl-devel python-devel pip`
    * `pip install python-qpid-proton`
  * Another test
    * `bin/activemq consumer`
    * in other window: `bin/activemq producer`
    
    * `bin/activemq producer --message "My message" --messageCount 1`
    * `bin/activemq producer --messageSize 100 --messageCount 1`
    * `bin/activemq producer --payloadUrl http://activemq.apache.org/schema/core/activemq-core.xsd --messageCount 1`
    
  * More tests
    * `cd amqutil`
    * `./install_linux.sh`
    * Tests: [amqutil](https://github.com/kevinboone/amqutil)
    
