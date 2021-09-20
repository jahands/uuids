Function Update-UuidsTXT {
    Write-Host 'starting...'
    ((0..99999) | ForEach-Object { [guid]::NewGuid() }).Guid | Out-File -Encoding utf8 uuids.txt
    $msg = "UUIDs Update $(Get-Date -Format 'o')"
    git add .
    git commit -a -m $msg
    Write-Host 'done...'
}
$i = 0
while($true){
    $i++
    if($i -gt 20){
        git push
        $i = 0
    }
    Update-UuidsTXT
}
