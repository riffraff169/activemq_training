## Setup
 * Install amqutil
   * `cd`
   * `sudo install -y git`
   * `git clone https://github.com/riffraff169/activemq_training.git`
   * `cd activemq_training`
   * `git submodule init`
   * `git submodule update`
   * `cd amqutil`
   * `ln -s ../target`
   * `sudo ./install_linux.sh`
 * Requires java 11+, 17 can be used as well
   * `sudo dnf install -y java-11-openjdk`
 * `cd`
 * `wget 'https://www.apache.org/dyn/closer.cgi?filename=/activemq/5.18.0/apache-activemq-5.18.0-bin.tar.gz&action=download' -O apache-activemq-5.18.0-bin.tar.gz`
 * `tar xzvf apache*.gz`
 * `cd apache-activemq-5.18.0`
 * If running in vagrant or on remote machine
   * `vi conf/jetty.xml`
      * Search for 8161
      * Change line above from 127.0.0.1 to 0.0.0.0
      * This listens for console port on all interfaces
 * `bin/activemq start`
 * Go to web console
    * Web browser at http://localhost:8161/admin
