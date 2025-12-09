Write-Host "Starting Data Generation..."  -ForegroundColor Green

#Defining output folder
$outputFolder = Join-Path $PSScriptRoot "../data"

#Check if the folder exist? create if not
if (-not (Test-Path $outputFolder)){
    New-Item -ItemType Directory -Force -Path $outputFolder | Out-Null
    Write-Host "Created Folder : $outputFolder"
}

#Generate 5 dummy user files

1..5 | ForEach-Object {
    $id = $_
    $filename = "user_$id.json"
    $filepath = Join-Path $outputFolder $filename

    #create a simple json object
    $userData = @{
        id = $id
        name = "User_$id"
        role = "Admin"
        timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    }       

    #convert to JSON and save
    $userData | ConvertTo-Json | Set-Content -Path $filepath
    Write-Host "Generated : $filename"

}

Write-Host "Done! 5 files created in '$outputFolder'" -ForegroundColor Green 