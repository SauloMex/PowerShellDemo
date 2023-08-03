$MyPat = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
$encoded = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$MyPat"))


$headers = @{
    "Authorization" = "Basic $encoded"
}

# $body = '{"resources": {}, "variables": {}}'
$organization = 'StreamOne'
$project = 'StreamOne%20ION'
# $pipelineid = '637'

# $uriRunRipeline = "https://dev.azure.com/$($organization)/$($project)/_apis/pipelines/$($pipelineid)/runs?api-version=6.1-preview.1"

# $pipelines = Invoke-RestMethod -Method Post -Uri $uriRunRipeline -ContentType "application/json" -Headers $headers -Body $body

# $buildId = $pipelines.id
# $name = $pipelines.name

# $pipelinename = $pipelines.pipeline.name

# Write-Host ("The $($pipelinename) pipeline version $($name) compilation has been launched")

Do {

    $buildId = "88336"
    #Sleep-Progress 300
    Write-Host "The functional tests hasn't finished. . ."


    $uriTimeLinePipeline = "https://dev.azure.com/$($organization)/$($project)/_apis/build/builds/$($buildId)/timeline"

    $pipelineTime = Invoke-RestMethod -Method Get -Uri $uriTimeLinePipeline -ContentType "application/json" -Headers $headers

    $tasks = $pipelineTime

    $mavenTask

    foreach ($task in $tasks.records) {
        if ($task.name -ceq "Maven pom.xml US INT") {
            $mavenTask = $task
            break            
        }
    }


}
while ($mavenTask.state -cne "completed" );
    
$urilogs = "https://dev.azure.com/$($organization)/$($project)/_apis/build/builds/$($buildId)/logs/$($mavenTask.log.id)?api-version=6.0"
$logresult = Invoke-RestMethod -Method Get -Uri $urilogs -ContentType "application/json" -Headers $headers

$logresult = $logresult -split "`n"
$r = $logresult | Select-String -Pattern 'Total tests run:'

Write-Host $r.Line