#Capture relevant reg keys for forensic details
Write-Output "Windows Environment Info"
# Set the error action preference to silently continue in case one of the regkeys isn't there
# There is a better way to handle the errors but we can worry about that later
$script:ErrorActionPreference = 'SilentlyContinue'

# You start with a normal variable but instad of running a command agter that, an array is conained in
# a @() write the array inside parenthises or create an empty array by leaving it empty
# don't confuse an array with a hashtable which is contained in @{}
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
    #'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Hot Fix' #not in win10
    'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages'
    'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
)

# Create an empty array.
$regKeyProperties = @()

# a foreach loop is started by the keyword foreach, then the conditions ar inside the parens
# it steps through each object as they are read in the array or hashtable e.g. 0,1,2,3,etc.
# The second var is the array or hashtable you want to cycle through and the first is the name 
# you are assigning to the indexed object to act upon in the logic section of the loop.
foreach ($keyPath in $regKeyPaths)
{
    # this will happen to every item passed into the loop. $keyPath is the regkey path currently 
    # in the loop you store it in a variable to add it to the empty array
    $keyProperty = Get-ItemProperty -Path $keyPath

    # Add the above regKey Properties to the array. Ask mme about this type of array vs the .NET method later
    $regKeyProperties += $keyProperty
}

# When the script is finished, you will still have access to the var $regkeyProperties so you can see all the objects.

















