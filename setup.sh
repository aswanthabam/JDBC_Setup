echo "JDBC Setup v.1.1"
cd ~

sudo apt update
echo "Downloading dependencies ..."
sudo apt install openjdk-8-jdk-headless -y
e_jdk=$?
sudo apt install mysql-server -y
e_sql=$?
echo "Installing php and MySQL driver ..."
sudo apt install php -y
e_php=$?
sudo apt install php-mysqlnd -y
e_php2=$?
sudo apt install python3 python3-tk python3-pip -y
e_python=$?
pip install matplotlib
e_matplotlib=$?
pip install mysql-connector-python
e_python_mysql=$?
python_path=$(which python3)
if [[ $python_path == *3 ]];then
  sudo ln -s $python_path ${python_path%?}
  e_python_sym=$?
  echo "Python symbolic link set"
else
  e_python_sym=1
fi


wget https://raw.githubusercontent.com/aswanthabam/JDBC_Setup/main/mysql.sql -P ./ -O mysql.sql
e_sql2=$?
sudo mysql < ./mysql.sql
e_sql3=$?
rm mysql.sql
$username="gct"
$password="password"


echo "Downloading driver..."

sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.1.0.zip -P /usr/local/lib/
e_sql_driver=$?
sudo unzip "/usr/local/lib/mysql-connector-j-8.1.0.zip" -d "/usr/local/lib/"
e_sql_driver2=$?

echo "Downloadig tomcat ..."
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.86/bin/apache-tomcat-9.0.86.zip -P ~
e_tomcat=$?
unzip "apache-tomcat-9.0.86"
e_tomcat2=$?
mv apache-tomcat-9.0.86 tomcat

echo "Updating classpath ..."
echo "export CLASSPATH=$CLASSPATH:/usr/local/lib/mysql-connector-j-8.1.0/mysql-connector-j-8.1.0.jar:~/tomcat/lib/*" >> ~/.bashrc
e_cls=$?

echo "Updating permissions ...."
sudo chmod +x tomcat/bin/*
e_perm=$?

echo -e "\n\nCompleted running installation script. below is the status of installation"

if [ $e_jdk -ne 0 ];then
  echo -e "\u001b[31m - Error installing JDK8"
else
  echo -e "\u001b[32m + Installed JDK 8"
fi

if [ $e_sql -ne 0 ];then
  echo -e "\u001b[31m - Error installing MySQL Server"
else
  echo -e "\u001b[32m + Installed MySQL Server"
fi

if [ $e_php -ne 0 ];then
  echo -e "\u001b[31m - Error installing PHP"
else
  echo -e "\u001b[32m + Installed PHP"
fi

if [ $e_php2 -ne 0 ];then
  echo -e "\u001b[31m - Error installing PHP MySQL Driver"
else
  echo -e "\u001b[32m + Installed PHP MySQL Driver"
fi
if [ $e_python -ne 0 ];then
  echo -e "\u001b[31m - Error installing Python and Tkinter"
else
  echo -e "\u001b[32m + Installed Python and Tkinter"
fi
if [ $e_matplotlib -ne 0 ];then
  echo -e "\u001b[31m - Error installing Matplotlib (python)"
else
  echo -e "\u001b[32m + Installed Matplotlib (python)"
fi
if [ $e_python_mysql -ne 0 ];then
  echo -e "\u001b[31m - Error installing Mysql Connector (python)"
else
  echo -e "\u001b[32m + Installed Mysql Connector (python)"
fi
if [ $e_python_sym -ne 0 ];then
  echo -e "\u001b[31m - Error setting symbolic link for python3 -> python"
else
  echo -e "\u001b[32m + Setted symbolic link for python3 -> python"
fi
if [ $e_sql2 -ne 0 ];then
  echo -e "\u001b[31m - Error Downloading SQL initialization script"
else
  echo -e "\u001b[32m + MySQL Initialization Script Loaded!"
fi

if [ $e_sql3 -ne 0 ];then
  echo -e "\u001b[31m - Error Initializing Initialization script for MySQL"
else
  echo -e "\u001b[32m + MySQL initialized !"
  echo -e "\t Username: $username"
  echo -e "\t Password: $password"
fi

if [ $e_sql_driver -ne 0 ];then
  echo -e "\u001b[31m - Error Downloading JDBC Driver"
else
  echo -e "\u001b[32m + Downloaded JDBC Driver!"
fi

if [ $e_sql_driver2 -ne 0 ];then
  echo -e "\u001b[31m - Error loading JDBC Driver to bin"
else
  echo -e "\u001b[32m + Loaded JDBC Driver to bin!"
fi

if [ $e_tomcat -ne 0 ];then
  echo -e "\u001b[31m - Error Downloading apache tomcat"
else
  echo -e "\u001b[32m + Downloaded apache tomcat!"
fi

if [ $e_tomcat2 -ne 0 ];then
  echo -e "\u001b[31m - Error Extracting Tomcat"
else
  echo -e "\u001b[32m + Extracted apache tomcat!"
fi

if [ $e_cls -ne 0 ];then
  echo -e "\u001b[31m - Error setting classpath!"
else
  echo -e "\u001b[32m + Setted classpath!"
fi

if [ $e_perm -ne 0 ];then
  echo -e "\u001b[31m - Error setting permissions for tomcat!"
else
  echo -e "\u001b[32m + Tomcat permissions set!"
fi

echo -e "\u001b[34mNB: To use the installed java programs you need to execute the programs in a new terminal!"
echo -e "\u001b[33m ----------------------------"
echo -e " -------- With ♥ AVC --------"
echo -e " ----------------------------"
