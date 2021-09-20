Function Update-UuidsTXT {
    ((0..99999) | ForEach-Object { New-Guid }).Guid | Out-File -Encoding utf8 uuids.txt
    $msg = "UUIDs Update $(Get-Date -Format 'o')"
    git add .
    git commit -a -m $msg
}
$i = 0
while($true){
    $i++
    if($i -gt 20){
        git push
    }
    Update-UuidsTXT
}
