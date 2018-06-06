# If you have enough time to type it in on a logged on computer
# type "cls" (clear-host) and leave the window open to get rid of the proof but let it keep running
# Also, I'm childish. ;D press F5 to run and ctrl+c to stop 
# also if you have a lot of time, you could wrap it in a timer to set it off unexpectedlyc

while ($true)
{
    $tone = Get-Random -Minimum 190 -Maximum 8000
    $length = Get-Random -Minimum 50 -Maximum 1000

    [console]::beep($tone,$length)
}

