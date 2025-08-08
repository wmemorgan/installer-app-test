# Generate-Files.ps1 - Run this before building the installer
param(
    [string]$PublishPath = "../MyCoolApp/bin/Release/net8.0/win-x64/publish",
    [string]$OutputFile = "GeneratedFiles.wxs"
)

Write-Host "Looking for files in: $PublishPath"

# Check if publish path exists
if (!(Test-Path $PublishPath)) {
    Write-Error "Publish path not found: $PublishPath"
    Write-Host "Make sure you've published your console app first!"
    exit 1
}

# Get all files from publish directory
$files = Get-ChildItem -Path $PublishPath -File | Sort-Object Name

Write-Host "Found $($files.Count) files to include in installer"

if ($files.Count -eq 0) {
    Write-Error "No files found in publish directory!"
    exit 1
}

# Start building the WiX fragment
$content = @'
<?xml version="1.0" encoding="UTF-8"?>
<Wix xmlns="http://wixtoolset.org/schemas/v4/wxs">
  <Fragment>
    <ComponentGroup Id="PublishedFilesGroup" Directory="INSTALLFOLDER">
'@

# Add each file as its own component
$componentIndex = 1
foreach ($file in $files) {
    $fileId = $file.Name.Replace(".", "_").Replace("-", "_").Replace(" ", "_")
    $componentId = "PublishedFile_$componentIndex"
    
    # Set KeyPath on the main executable
    $keyPath = ""
    if ($file.Name -eq "MyCoolApp.exe") {
        $keyPath = ' KeyPath="yes"'
    }
    
    $content += "`n      <Component Id=`"$componentId`">"
    $content += "`n        <File Id=`"$fileId`" Source=`"$PublishPath/$($file.Name)`"$keyPath />"
    $content += "`n      </Component>"
    
    $componentIndex++
}

# Close the fragment
$content += @'

    </ComponentGroup>
  </Fragment>
</Wix>
'@

# Write to file
[System.IO.File]::WriteAllText($OutputFile, $content)
Write-Host "Generated $OutputFile with $($files.Count) files"
Write-Host "Each file is in its own component to avoid WiX GUID issues"