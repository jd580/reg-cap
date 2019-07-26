

# Define some variables
$Final_lab_dir = "C:\Users\$ENV:Username\Desktop\Final_Lab"
$DEAD_dir = "C:\Users\$ENV:Username\Desktop\Final_Lab\DEAD"
$ALIVE_dir = "C:\Users\$ENV:Username\Desktop\Final_Lab\ALIVE"
$Process_Results = "C:\Users\$ENV:Username\Desktop\Final_Lab\Process_Results"

# Creates the dirs
New-Item $Final_lab_dir -ItemType Directory -ErrorAction SilentlyContinue
New-Item $DEAD_dir -ItemType Directory -ErrorAction SilentlyContinue
New-Item $ALIVE_dir -ItemType Directory -ErrorAction SilentlyContinue
New-Item $Process_Results -ItemType Directory -ErrorAction SilentlyContinue


# Ping sweep workflow
workflow Test-ConnectionQuickly 
{   
    param(
    [string[]]$ComputerName
    )
    Foreach -parallel ($Ip in $ComputerName) 
    {
        $PingResult = Test-Connection $Ip -Count 1 -Quiet
        if ($PingResult -eq $true)
        {
            "Host: $Ip is alive."
            $global:AliveIp += $Ip
        }
        else 
        {
            "Host: $Ip is dead."
            $global:DeadIp += $Ip
        }
    }
}

if (Test-Path "$Process_Results\ips.txt")
{
    $Ips = Get-Content "$Process_Results\ips.txt"
}
else
{
    # Define forth octet
    $ForthOctet = @(30..104)
    #echo $ForthOctet

    # Create IPs
    $Ips = foreach ($Octet in $ForthOctet)
    {
        "214.15.106.$Octet"
    }
    #Echo $Ips

    # Write Ips to a file
    $Ips > "$Process_Results\ips.txt"
}

# Init a variable 
$Answer = "n"

if ($DeadIp -ne $null)
{
    $Answer = Read-Host "Do you want to skip dead ips found in previous scan?(y/n)"
}

if ($Answer -eq "n")
{
    # Init a variable
    $AliveIp = @()
    Test-ConnectionQuickly -ComputerName $Ips
}
elseif ($Answer -eq "y")
{
    # Ping sweep
    Foreach ($Ip in $AliveIp) 
    {
        $PingResult = Test-Connection $Ip -Count 1 -Quiet
        if ($PingResult -eq $true)
        {
            "Host: $Ip is alive."
        }
        else 
        {
            "Host: $Ip is dead."
            $DeadIp += $Ip
        }
    }
}
else
{
    Write-Error "Invalid response to prompt"

    exit 

}
# Target only live ips.
foreach ($Ip in $AliveIp)
{
    # Get that process info
    $ProcessInfo = Get-WmiObject -class win32_process -ComputerName $Ip

    # Init a counting variable
    $counter = 0
    # Make it readable-ish
    $SpecificProcessInfo = Foreach ($Process in $ProcessInfo) 
    {
        ($Process).ProcessName

        # Count instances of svchost matching the Process Name
        if (($Process).ProcessName -eq "svchost.exe")
        {
            $counter ++
            Write-Warning "Found $counter svchost.exe process on $Ip."
        }

        ($Process).ProcessId
        ($Process).ParentProcessId
        ($Process).CommandLine
        ($Process).ExecutablePath
    }

    # Display some a malware warning
    if ($counter -ge 4)
    {
        Write-Warning "You found MALWARE, you win!! You found svchost.exe $counter times on $Ip."
    }

    # Write results to a file
    $SpecificProcessInfo >> "$Process_Results\$Ip.txt"
}
