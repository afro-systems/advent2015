$inputCities = Get-Content ./level9.txt | 
  ForEach-Object { $_ -replace "(.*) to (.*) = (.*)", '$1,$2,$3' } |
  ConvertFrom-Csv -Header pointA,pointB,distance,done

[int32]$count = 0

<# while ($count -lt $inputCities.length)
{
    ForEach-Object {
        $trip = $PSItem
        
        if ($inputCities[$trip.done] -neq $true)
        {
          
        }
    }
} #>

$inputCities.length