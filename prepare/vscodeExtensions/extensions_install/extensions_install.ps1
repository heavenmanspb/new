# Script for installing Visual Studio Code extensions

try
{
    $extensions = Get-Content -Path .\extensions_list.txt -ErrorAction Stop
}
catch
{
    Write-Output "Error! Can't read extensions_list.txt."
	Start-Sleep -Seconds 2
	Exit
}

$cmd_list = "code --list-extensions"
Invoke-Expression $cmd_list -OutVariable output | Out-Null
$installed = $output -split "\s"

foreach ($ext in $extensions) {
    if ($installed.Contains($ext)) {
        Write-Host $ext "already installed." -ForegroundColor Gray
    } else {
        Write-Host "Installing" $ext "..." -ForegroundColor White
		$cmd_install = "code --install-extension " + $ext
		Invoke-Expression $cmd_install -OutVariable Out-Null
    }
}