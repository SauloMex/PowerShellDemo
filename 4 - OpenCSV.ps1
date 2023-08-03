
$list = Import-Csv .\products.csv | Select-Object -Property ProductName | ConvertTo-Json >> .\result.json

Write-Host $list