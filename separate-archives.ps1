$dirs = (ls -Name)
foreach ($dir in $dirs){
    if ($dir -ne "separate-archives.ps1") {
        7z.exe a "$($dir).zip" "$($dir)"    
    }
}
