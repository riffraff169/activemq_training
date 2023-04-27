### Master/Slave brokers
  * Copy new configs
    * `cp ~/activemq_training/02_Master_Slave/broker1/activemq1.xml broker1/conf/activemq.xml`
    * `cp ~/activemq_training/02_Master_Slave/broker2/activemq1.xml broker2/conf/activemq.xml`
  * Make a data dir
    * `mkdir /var/lib/activemq`
  * Restart brokers
    * `broker1/bin/broker1 restart`
    * `broker2/bin/broker2 restart`
  * Go to console of broker2
    * http://ip:8162/admin
    * Notice the console is not responding
  * Go to console of broker1
    * http://ip:8161/admin
    * This broker is responding
  * In a Master/Slave configuration, all brokers are running
  But only one is answering at a time.
  The slaves all monitor a file trying to aquire a lock.
  When the master dies, the lock is released, and one of the slaves gets the lock.
  There is no primary and secondary.
  Whatever broker has the lock is the master. If a previous master starts back up, it is a slave.
  A master only switches when it goes down and another picks it up.
