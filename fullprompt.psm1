function shite {
    $battery="" | Select-Object -Property percent,icon
    $battery.percent = (Get-WmiObject win32_battery).estimatedChargeRemaining
    $batteryChargeState=(gwmi -Class batterystatus -Namespace root\wmi).charging
    if ($batteryChargeState -eq $True){$battery.icon=[char]0xf583}
    elseif ([int]$battery.percent -le 10){$battery.icon=[char]0xf579}
    elseif ([int]$battery.percent -gt 10 -and [int]$battery.percent -le 20){$battery.icon=[char]0xf57a}
    elseif ([int]$battery.percent -gt 20 -and [int]$battery.percent -le 30){$battery.icon=[char]0xf57b}
    elseif ([int]$battery.percent -gt 30 -and [int]$battery.percent -le 40){$battery.icon=[char]0xf57c}
    elseif ([int]$battery.percent -gt 40 -and [int]$battery.percent -le 50){$battery.icon=[char]0xf57d}
    elseif ([int]$battery.percent -gt 50 -and [int]$battery.percent -le 60){$battery.icon=[char]0xf57e}
    elseif ([int]$battery.percent -gt 60 -and [int]$battery.percent -le 70){$battery.icon=[char]0xf57f}
    elseif ([int]$battery.percent -gt 70 -and [int]$battery.percent -le 80){$battery.icon=[char]0xf580}
    elseif ([int]$battery.percent -gt 80 -and [int]$battery.percent -le 90){$battery.icon=[char]0xf581}
    elseif ([int]$battery.percent -gt 90 -and [int]$battery.percent -lt 100){$battery.icon=[char]0xf581}
    elseif ([int]$battery.percent -eq 100){$battery.icon=[char]0xf578}
    return $battery
}


function prompt {$firstblock = " ω ","yellow","black"
$battery = shite
$secondblock = " $($battery.icon) $($battery.percent)% ","magenta", "black"
$thirdblock = " $((Get-Date).GetDateTimeFormats()[19]) ","blue","black"
$fourthblock  = " $((pwd).path) ","red","white"
$promptblocks = $firstblock, $secondblock, $thirdblock, $fourthblock
foreach ($promptblock in $promptblocks){
    write-host "$([char]0xe0b0)" -ForegroundColor Black -BackgroundColor $promptblock[1] -NoNewline;
    write-host "$($promptblock[0])" -ForegroundColor $promptblock[2] -BackgroundColor $promptblock[1] -NoNewline;
    write-host "$([char]0xe0b0)" -ForegroundColor $promptblock[1] -BackgroundColor black -NoNewline;
}
write-host ""
write-host "$([char]0xe0b0)" -ForegroundColor Black -BackgroundColor gray -NoNewline;
write-host "  " -ForegroundColor black -BackgroundColor gray -NoNewline;
write-host "$([char]0xe0b0)" -ForegroundColor gray -BackgroundColor black -NoNewline;

write-host "$([char]0xe0b0)" -ForegroundColor Black -BackgroundColor cyan -NoNewline;
write-host " $ " -ForegroundColor black -BackgroundColor cyan -NoNewline;
write-host "$([char]0xe0b0)" -ForegroundColor cyan -BackgroundColor black -NoNewline;
return " "
}
