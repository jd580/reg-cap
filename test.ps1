#Capture relevant reg keys for forensic details
Get-Item -path 'registry::HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System'
Get-Item -path 'registry::HKEY_LOCAL_MACHINE\system\CurrentControlSet\Control'