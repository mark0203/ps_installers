$code = {
python -m pip install --upgrade pip
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-faker
pip install webdrivermanager
webdrivermanager -d "C:\Program Files\Python36\Scripts" -l "C:\Program Files\Python36\Scripts" chrome firefox
pip install robotframework-ride
}
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.6.8/python-3.6.8-amd64.exe" -OutFile "c:/temp/python-3.6.8-amd64.exe"
c:/temp/python-3.6.8-amd64.exe /passive InstallAllUsers=1 PrependPath=1 Include_launcher=1 Include_test=0 | out-null
rm c:/temp/python-3.6.8-amd64.exe -recurse -force
Start-Process -FilePath powershell.exe -ArgumentList $code -verb RunAs -WorkingDirectory C: | out-null
python --version
robot --version
write-host "Gefeliciteerd, RobotFramework geïnstalleerd! (Dat rijmt!)  "
write-host "Druk op een toets om dit venster te sluiten. "
$response = read-host
if ( $response -ne "Y" ) { exit } 
