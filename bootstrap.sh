#!/usr/bin/env bash

ANDROID_SDK_FILENAME=android-sdk_r24.4.1-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME

#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y npm git openjdk-7-jdk ant expect 
apt-get install -y lib32stdc++6 lib32z1
npm install -g n
n stable

curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME
sudo chown -R vagrant android-sdk-linux/

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
# echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386" >> /home/vagrant/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc

expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-23,build-tools-23.0.3
expect { 
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'

# Ionic CLI tools
sudo npm install -g cordova
sudo npm install -g ionic

#sudo gem install sass
