$root = (split-path -parent $MyInvocation.MyCommand.Definition)

$packageRoot = "$root"
$versionFile = "$packageRoot\.version"
$artifactsPath = "$packageRoot\Artifacts"
$targetNugetExe = "$packageRoot\nuget.exe"

If (Test-Path $artifactsPath)
{
    # Delete any existing output.
    Remove-Item $artifactsPath\*.nupkg
}

If (!(Test-Path $targetNugetExe))
{
    $sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"

    Write-Host "NuGet.exe not found - downloading latest from $sourceNugetExe"

    $sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"

    Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
}

$VERSION = (Get-Content $versionFile)
Write-Host "Setting .nuspec version tag to $VERSION"
$compiledNuspec = "$packageRoot\compiled.nuspec"

# Create new packages for any nuspec files that exist in this directory.
Foreach ($nuspec in $(Get-Item "$packageRoot\*.nuspec"))
{
	$content = (Get-Content $nuspec)
    $content = $content -replace '\$version\$',$VERSION
	$content = $content -replace '\$configuration\$',$CONFIGURATION
	$content = $content -replace '\$framework\$',$FRAMEWORK
	$content = $content -replace '\$root\$',$root
    $content | Out-File $compiledNuspec

    & $targetNugetExe pack $compiledNuspec -outputdirectory $artifactsPath 
}


# Delete compiled temporary nuspec.
If (Test-Path $compiledNuspec)
{
    Remove-Item $compiledNuspec
}
