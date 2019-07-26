# Capture relevant reg keys for forensic analysis
Write-Output "Windows Environment Info"
# Set the error action preference to silently continue in case one of the regkeys isn't there
$script:ErrorActionPreference = 'SilentlyContinue'

# Define key paths
$regKeyPaths = @(
    'registry::HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System' #grab system hardware info
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control' #params that control system startup
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\hivelist'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\FileRenameOperations'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\KnownDLLs'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation'
    'registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services'
    'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug'
    'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages'
    'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
)

# Create an empty array.
$regKeyProperties = @()


foreach ($keyPath in $regKeyPaths)
{

    $keyProperty = Get-ItemProperty -Path $keyPath

    # Add the above regKey Properties to the array.
    $regKeyProperties += $keyProperty
}

# When the script is finished, you will still have access to the var $regkeyProperties so you can see all the objects. 
