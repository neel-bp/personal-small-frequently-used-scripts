﻿function bulkrename($editor="vimuNONE", $editorArgs="", $pattern="", $attrs="") {
$sourcetemp = New-TemporaryFile
$targettemp = New-TemporaryFile

if ($attrs -eq ""){
(ls -Path "$($pattern)").Name,"" | Out-File $sourcetemp.FullName -Encoding utf8
(ls -Path "$($pattern)").Name,"" | Out-File $targettemp.FullName -Encoding utf8
} elseif ($attrs -eq "all"){
(ls -Path "$($pattern)" -Attributes "d","a","r","h").Name,"" | Out-File $sourcetemp.FullName -Encoding utf8
(ls -Path "$($pattern)" -Attributes "d","a","r","h").Name,"" | Out-File $targettemp.FullName -Encoding utf8
} else {
(ls -Path "$($pattern)" -Attributes $attrs).Name,"" | Out-File $sourcetemp.FullName -Encoding utf8
(ls -Path "$($pattern)" -Attributes $attrs).Name,"" | Out-File $targettemp.FullName -Encoding utf8
}

if ($editor -eq "vimuNONE"){
    Start-Process -FilePath "vim" -ArgumentList "-u","NONE","`"$($targettemp.FullName)`"" -Wait -NoNewWindow
} elseif($editor -ne "vimuNONE" -and $editorArgs -ne "") {
    Start-Process -FilePath "$($editor)" -ArgumentList "`"$($targettemp.FullName)`"","$($editorArgs)" -Wait -NoNewWindow
} elseif($editor -ne "vimuNONE" -and $editorArgs -eq "") {
    Start-Process -FilePath "$($editor)" -ArgumentList "`"$($targettemp.FullName)`"" -Wait -NoNewWindow
}

$sourceArr = Get-Content $sourcetemp.FullName
$targetArr = Get-Content $targettemp.FullName

foreach ($line in $sourceArr){
   if ($line -eq ""){continue}
   Rename-Item -LiteralPath "$($line)" -NewName "$($targetArr[$sourceArr.IndexOf($line)])" -ErrorAction Ignore
}
Remove-Item $sourcetemp.FullName -Force
Remove-Item $targettemp.FullName -Force
}
