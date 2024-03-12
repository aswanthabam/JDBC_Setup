wget https://tallymirror.tallysolutions.com/download_centre/R6.6.3_GA/TE9/Full/setup.exe
e_d=$?
sudo apt install wine
e_wine=$?
wine setup.exe
e_setup=$?

if [ $e_d -ne 0 ];then
  echo -e "\u001b[31m - Error downloading setup file"
else
  echo -e "\u001b[32m + Downloaded setup.exe"
fi
if [ $e_wine -ne 0 ];then
  echo -e "\u001b[31m - Error installing wine"
else
  echo -e "\u001b[32m + Installed wine"
fi
if [ $e_setup -ne 0 ];then
  echo -e "\u001b[31m - Error running setup"
else
  echo -e "\u001b[32m + Setup started"
fi
echo -e "\u001b[33m ----------------------------"
echo -e " -------- With ♥ AVC --------"
echo -e " ----------------------------"
