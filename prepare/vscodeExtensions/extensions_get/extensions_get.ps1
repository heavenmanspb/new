# Script for batch installing Visual Studio Code extensions
# Specify extensions to be checked & installed by modifying $extensions

$cmd_list = "code --list-extensions"
Invoke-Expression $cmd_list -OutVariable output | Out-Null
$installed = $output -split "\s"
$installed | Out-File -FilePath .\extensions_list.txt
Write-Host  $installed.Length "extensions write to extensions_list.txt" 
Start-Sleep -Seconds 2