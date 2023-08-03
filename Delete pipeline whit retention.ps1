$MyPat = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaassssssssssssss'
$encoded = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$MyPat"))


$header = @{
    "Authorization" = "Basic $encoded"
}

 $organization = 'StreamOne'
 $project = 'StreamOne%20TNG'
 $id = 806

#all builds for a definition
$url = "https://dev.azure.com/$organization/$project/_apis/build/builds?definitions=" + $id + "&api-version=6.0-preview.5"
$builds = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header


 
$builds.value | Sort-Object id|ForEach-Object {
#report on retain status
Write-Host " BuildId" $_.id "- retainedByRelease:" $_.retainedByRelease

# Write-Host ConvertTo-Json @{"retainedByRelease"='false'}
#  #api call for a build
#   $url = "https://dev.azure.com/$organization/$project/_apis/build/builds/" + $_.id + "?api-version=6.0-preview.5"
 
#  #set retainedByRelease property to false
#   Invoke-RestMethod -Uri $url -Method Patch -Body (ConvertTo-Json @{"retainedByRelease"='false'}) -ContentType "application/json" -Headers $header

} 

# $url = "https://dev.azure.com/$organization/$project/_apis/build/builds?definitions=" + $id + "&api-version=6.0-preview.5"
# $builds = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header
 
# $builds.value | Sort-Object id|ForEach-Object {
# #report on retain status
# Write-Host " BuildId" $_.id "- retainedByRelease:" $_.retainedByRelease
# }