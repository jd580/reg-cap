$test = @(1,2,3,4,5,6)
foreach($num in $test)
{
    $sum = $sum + $num
}
Write-Output $sum
$sum = 0
