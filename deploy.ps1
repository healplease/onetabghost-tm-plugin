# get current user's home directory
$homeDir = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)

# copy folder from current directory to %current user%\OpenplanetNext\Plugins\OneTapGhost folder
Copy-Item -Path . -Destination "$homeDir\OpenplanetNext\Plugins\OneTapGhost" -Recurse -Force

# instead, pack all files in this folder into a zip archive, then change the extension to .op and copy it to the OpenplanetNext\Plugins folder
Compress-Archive -Path .\* -DestinationPath OneTapGhost.zip -Force
Rename-Item -Path OneTapGhost.zip -NewName OneTapGhost.op

# delete the old .op file if it exists
Remove-Item -Path "$homeDir\OpenplanetNext\Plugins\OneTapGhost.op" -Force -ErrorAction SilentlyContinue
Copy-Item -Path .\OneTapGhost.op -Destination "$homeDir\OpenplanetNext\Plugins" -Force

# delete zip and op files
Remove-Item -Path .\OneTapGhost.zip -Force -ErrorAction SilentlyContinue
Remove-Item -Path .\OneTapGhost.op -Force -ErrorAction SilentlyContinue