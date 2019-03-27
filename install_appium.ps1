$base_url = "https://github.com/appium/appium-desktop/releases/download/v"
$app_ver = "1.10.0"
$temp_dir = "c:\temp"
$exe = "appium-desktop-web-setup-$app_ver.exe"
#$args = "/S"

# Download Appium and place it in the temp_dir
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "$base_url$app_ver/$exe" -OutFile "$temp_dir\$exe"

# Install Appium and wait for the process to finish
$inst_process = Start-Process -FilePath "$temp_dir\$exe" -PassThru -Wait #-ArgumentList $args

# Show that Appium installation failed if this happened
if ($inst_process.ExitCode -ne 0) {
    "Installation of '$exe' failed"
    exit 0
}

# Remove the exe from the temp folder
rm "$temp_dir\$exe" -recurse -force


# End session
write-host "Druk op een toets om dit venster te sluiten. "
$response = read-host
if ( $response -ne "Y" ) { 
    exit 
} 
