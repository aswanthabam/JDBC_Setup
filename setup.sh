sudo apt update
echo "Downloadin dependencies ..."
sudo apt install openjdk-8-jdk-headless
sudo apt install mysql-server
echo "Installing php and MySQL driver ..."
sudo apt install php php-mysqlnd
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

