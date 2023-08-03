#Call a static class
[System.IO.Path]::GetFileName('C:\Windows\explorer.exe')

#For any class is necesary make a instance

$Object = [System.DateTime]::Now

$Object.AddHours(15)