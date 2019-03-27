$base_url = "https://github.com/oneclick/rubyinstaller2/releases/download/"
$app_ver_major = "2.6"
$app_ver_minor = "1-1"
$app_ver = "$app_ver_major.$app_ver_minor"
$temp_dir = "c:\temp"
$exe = "rubyinstaller-devkit-$ruby_ver-x64.exe"
$args = "/silent /tasks='assocfiles,modpath'"

$gems = {
    gem update --system
    $gem_list = gem list
    if ($gem_list -like "lapis_lazuli*") {
        write-host "Skip gem installation step, 'lapis_lazuli' is already installed"
    }
    else {
        gem install lapis_lazuli
    }

    if ($gem_list -like "webdrivers*") {
        write-host "Skip gem installation step, 'webdrivers' is already installed"
    }
    else {
        gem install webdrivers
    }

    if ($gem_list -like "faker*") {
        write-host "Skip gem installation step, 'faker' is already installed"
    }
    else {
        gem install faker
    }
}

# Download Ruby and place it in the temp_dir
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#Invoke-WebRequest -Uri "$base_url/RubyInstaller-$ruby_ver/$exe" -OutFile "$temp_dir\$exe"

# Install Ruby and wait for the process to finish
#$ruby_inst_process = Start-Process -FilePath "$temp_dir\$exe" -ArgumentList $args -PassThru -Wait 

# Show that Ruby installation failed if this happened
#if ($ruby_inst_process.ExitCode -ne 0) {
#    "Ruby installation failed"
#    exit 0
#}

# Remove the exe from the temp folder
#rm "$temp_dir\$exe" -recurse -force

# Install the gems and wait for the process to finish
Start-Process -FilePath powershell.exe -ArgumentList $gems -PassThru -Wait

# Done
write-host "
Gefeliciteerd, Ruby + Cucumber + Selenium-webdriver + Watir + LapisLazuli zijn geïnstalleerd! 
"
write-host "Druk op een toets om dit venster te sluiten. "
$response = read-host
if ( $response -ne "Y" ) { exit } 
