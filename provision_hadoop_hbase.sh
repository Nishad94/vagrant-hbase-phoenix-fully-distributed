sudo apt-get update
sudo apt-get install default-jdk -y
if [ -z ${JAVA_HOME+x} ]; then
  sudo -s
  echo "Setting JAVA_HOME env var"
  echo JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-amd64" >> /etc/environment
  source /etc/environment
  echo $JAVA_HOME
  su vagrant
else
  echo "JAVA_HOME is already set!"
fi
if [ ! -d "/home/vagrant/hadoop" ]; then
  cp -r /vagrant/hadoop-2.7.3/ /home/vagrant/
  mv /home/vagrant/hadoop-2.7.3 /home/vagrant/hadoop
  sudo chown -R vagrant:vagrant /home/vagrant/hadoop/
  sudo cp /vagrant/core-site.xml /home/vagrant/hadoop/etc/hadoop/
  sudo cp /vagrant/hdfs-site.xml /home/vagrant/hadoop/etc/hadoop/
  sudo cp /vagrant/yarn-site.xml /home/vagrant/hadoop/etc/hadoop/
  echo "Installed Hadoop ~~~~"
  echo HADOOP_PREFIX="/home/vagrant/hadoop" >> /home/vagrant/.bashrc
  echo HADOOP_HOME=$HADOOP_PREFIX >> /home/vagrant/.bashrc
  echo HADOOP_COMMON_HOME=$HADOOP_PREFIX >> /home/vagrant/.bashrc
  echo HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop >> /home/vagrant/.bashrc
  echo HADOOP_HDFS_HOME=$HADOOP_PREFIX >> /home/vagrant/.bashrc
  echo HADOOP_MAPRED_HOME=$HADOOP_PREFIX >> /home/vagrant/.bashrc
  echo HADOOP_YARN_HOME=$HADOOP_PREFIX >> /home/vagrant/.bashrc
  source /home/vagrant/.bashrc
else
  echo "HADOOP already installed!"
fi
