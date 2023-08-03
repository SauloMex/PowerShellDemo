$test = "||Adam Bertram|| 2122 Acme Ct, Atlantic City, NJ
--||Joe Jonesy||-- 555 Lone St, Las Vegas, NV
==|Suzie Shoemaker|== 6783 Main St, Los Angelas, CA"

$test = $test -split "`n"
$r = $test | Select-String -Pattern 'Acme'
Write-Host "$($r)" 

