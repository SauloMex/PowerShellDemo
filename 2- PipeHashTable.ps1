Get-ChildItem | Select-Object FullName, Name, @{Name= 'DateTime'; Expression={Get-Date}}, @{Name='PropertyName'; Expression={'CustomValue'}}


