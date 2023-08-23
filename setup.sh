echo "Downloadin dependencies ..."
sudo apt install openjdk-8-jdk-headless
sudo apt install mysql-server

wget https://raw.githubusercontent.com/aswanthabam/JDBC_Setup/main/mysql.sql -o mysql.sql
sudo mysql < ./mysql.sql
rm mysql.sql

echo "Mysql credentials"
echo "User name: gct"
echo "Password: password"

echo "Downloading driver..."

sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.1.0.zip -o /usr/local/lib/mysql-connector-asw-j-8.1.0.jar

echo "export CLASSPATH=$CLASSPATH:/usr/local/lib/mysql-connector-j-8.1.0.jar" >> ~/.bashrc
