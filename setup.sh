echo "Downloadin dependencies ..."
sudo apt install openjdk-8-jdk-headless
sudo apt install mysql-server

sudo mysql < ./mysql.sql

echo "Mysql credentials"
echo "User name: gct"
echo "Password: password"

echo "Downloading driver..."

sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.1.0.zip -o /usr/local/lib/mysql-connector-asw-j-8.1.0.jar

echo "export CLASSPATH=$CLASSPATH:/usr/local/lib/mysql-connector-j-8.1.0.jar" >> ~/.bashrc
