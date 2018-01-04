$root = (split-path -parent $MyInvocation.MyCommand.Definition)

$packageRoot = "$root"
$artifactsPath = "$packageRoot\Artifacts"
$targetNugetExe = "$packageRoot\nuget.exe"

# Publish new packages for any nupkg files that exist in this directory.
Foreach ($nupkg in $(Get-Item $artifactsPath\*.nupkg))
{
   & $targetNugetExe push $nupkg -Source https://api.nuget.org/v3/index.json
}