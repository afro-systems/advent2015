$floors = $(Get-Content "advent01.txt").ToCharArray()
$santa = 0

ForEach ($floor in $floors)
{
    if ($floor -eq '(')
    {
        $santa++ 
    }
    elseif ($floor -eq ')')
    {
        $santa-- 
    }
}

Write-Host “Santa is on the $santa floor.”