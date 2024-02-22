sudo apt update
echo "Downloading dependencies ..."
sudo apt install openjdk-8-jdk-headless mysql-server -y
echo "Installing php and MySQL driver ..."
sudo apt install php php-mysqlnd -y
wget https://raw.githubusercontent.com/aswanthabam/JDBC_Setup/main/mysql.sql -P ./ -O mysql.sql
sudo mysql < ./mysql.sql
rm mysql.sql

echo "Mysql credentials"
echo "User name: gct"
echo "Password: password"

echo "Downloading driver..."

sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.1.0.zip -P /usr/local/lib/
sudo unzip "/usr/local/lib/mysql-connector-j-8.1.0.zip" -d "/usr/local/lib/"
echo "export CLASSPATH=$CLASSPATH:/usr/local/lib/mysql-connector-j-8.1.0/mysql-connector-j-8.1.0.jar" >> ~/.bashrc

echo "Downloadig tomcat ..."
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.86/bin/apache-tomcat-9.0.86.zip -P ~/
sudo unzip "apache-tomcat-9.0.86" -d "~/"
mv apache-tomcat-9.0.86 tomcat
echo "export CLASSPATH=$CLASSPATH:~/apache-tomcat-9.0.86/lib/*" >> ~/.bashrc
