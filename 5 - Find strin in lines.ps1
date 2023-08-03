$Var = 
@'
Device Number:  1
PCIe slot:  3
Firmware Version:  5.1.4
Temperature:  45C
State:  Online
'@

$Firmware = $var -replace '(?ms).+^Firmware Version:\s+([0-9.]+).+','$1'
$Firmware

