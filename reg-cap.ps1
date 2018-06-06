#Capture relevant reg keys for forensic details
Write-Output "Windows Environment Info"
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System' #grab system hardware info
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control' #params that control system startup
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\hivelist'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\FileRenameOperations'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\KnownDLLs'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug'
#Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Hot Fix' #not in win10
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages'
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'



