$gem_list = gem list
if ($gem_list -like "lapis_lazuli5*") {
    write-host "Skip gem installation step, 'lapis_lazuli' is already installed"
}
else {
    write-host "needs to be installed"
    gem install lapis_lazuli
}
