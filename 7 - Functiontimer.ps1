Function Sleep-Progress($seconds) {
    $s = 0;
    $p = 0;
    Do {
        $p = [math]::Round(100 - (($seconds - $s) / $seconds * 100));
        Write-Progress -Activity "Waiting to 100 seconds..." -Status "$p% Complete:" -SecondsRemaining ($seconds - $s) -PercentComplete $p;
        [System.Threading.Thread]::Sleep(500)
        $s++;
    }
    While($s -lt $seconds);
    $p=$p+10;
    Write-Progress -Activity "Waiting to 100 seconds..." -Status "$p% Complete:" -SecondsRemaining ($seconds - $s) -PercentComplete $p;

}




Sleep-Progress 10