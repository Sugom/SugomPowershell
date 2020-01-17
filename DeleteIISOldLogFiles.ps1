#============================================================================
# Delete IIS old log files
#============================================================================

# Path to search
$path = "C:\inetpub\logs\LogFiles"
# Search pattern (e.g : *.*, *.log ...)
$pattern = "*.*"
# Days to delete (e.g : 15 - Files older than 15 days created)
$conditionDate = (Get-Date).AddDays(-15)
# Include sub directory
$incSubDirectory = $true

if($incSubDirectory -eq $true){
    Get-ChildItem -Path $path -Filter $pattern -Recurse | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $conditionDate } | Remove-Item -Force
}else{
    Get-ChildItem -Path $path -Filter $pattern | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $conditionDate } | Remove-Item -Force
}