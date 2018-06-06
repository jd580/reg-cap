#Capture relevant reg keys for forensic details
Write-Output "Windows Environment Info"
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System' #grab system hardware info
Get-ItemProperty -path 'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control' #params that control system startup


