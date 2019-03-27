$base_url = "https://dl.google.com/dl/android/studio/install"
$app_ver = "3.3.2.0"
$exe = "android-studio-ide-182.5314842-windows.exe"
$temp_dir = "c:\temp"
$args = "/S"

# Download Android Studio and place it in the temp_dir
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "$base_url/$app_ver/$exe" -OutFile "$temp_dir\$exe"

# Install Android Studio and wait for the process to finish
$inst_process = Start-Process -FilePath "$temp_dir\$exe" -ArgumentList $args -PassThru -Wait

# Show that Android Studio installation failed if this happened
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
