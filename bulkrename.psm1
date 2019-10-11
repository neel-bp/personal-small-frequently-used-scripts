function bulkrename($editor="vim") {
$sourcetemp = New-TemporaryFile
$targettemp = New-TemporaryFile

ls -Name | Out-File $sourcetemp.FullName -Encoding utf8
ls -Name | Out-File $targettemp.FullName -Encoding utf8

if ($editor -eq "vim"){
    Start-Process -FilePath "$($editor)" -ArgumentList "-u","NONE","`"$($targettemp.FullName)`"" -Wait -NoNewWindow
} else {
    Start-Process -FilePath "$($editor)" -ArgumentList "`"$($targettemp.FullName)`"" -Wait
}

$sourceArr = Get-Content $sourcetemp.FullName
$targetArr = Get-Content $targettemp.FullName

foreach ($line in $sourceArr){
    Rename-Item -LiteralPath $line -NewName $targetArr[$sourceArr.IndexOf($line)]
}
Remove-Item $sourcetemp.FullName -Force
Remove-Item $targettemp.FullName -Force
}
