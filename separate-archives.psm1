function separateArchive{
    $dirs = (ls -Name)
    foreach ($dir in $dirs){
        7z a "$($dir).zip" "$($dir)"
    }
}

#either put the function in profile or just put it somewhere and import the function with import-module
