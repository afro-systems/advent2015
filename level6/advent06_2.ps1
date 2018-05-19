$instructions = Get-Content level6.txt
$table = New-Object "int[,]" 1000,1000
[regex]$checker = "^.*(.) ([0-9]{1,3}),([0-9]{1,3}) through ([0-9]{1,3}),([0-9]{1,3})"
[int]$sum = 0

function Increase-Brightness ([ref]$table, [int]$x1, [int]$y1, [int]$x2, [int]$y2)
{ 
  for ($i = $x1; $i -le $x2; $i++)
	{
		for ($j = $y1; $j -le $y2; $j++)
		{
  		$table.Value[$i,$j]++
		}
  }
}

function Decrease-Brightness ([ref]$table, [int]$x1, [int]$y1, [int]$x2, [int]$y2)
{ 
	for ($i = $x1; $i -le $x2; $i++)
	{
		for ($j = $y1; $j -le $y2; $j++)
		{
  		if ($table.Value[$i,$j] -ge 1)
			{
    		$table.Value[$i,$j]--
  		}   
		}
  }
}

function Double-Brightness ([ref]$table, [int]$x1, [int]$y1, [int]$x2, [int]$y2)
{ 
	for ($i = $x1; $i -le $x2; $i++)
	{
		for ($j = $y1; $j -le $y2; $j++)
		{
  		$table.Value[$i,$j]+=2 
		}
  }
}

ForEach ($_ in $instructions)
{
	if ($_ -match $checker)
	{
		switch ($matches[1])
		{
    	"n" { Increase-Brightness ([ref]$table) $matches[2] $matches[3] $matches[4] $matches[5] } 
      "f" { Decrease-Brightness ([ref]$table) $matches[2] $matches[3] $matches[4] $matches[5] }
      "e" { Double-Brightness ([ref]$table) $matches[2] $matches[3] $matches[4] $matches[5] }
    }
	}
}

ForEach ($_ in $table)
{
	$sum = $_ + $sum
}

Write-Host "The lights are $sum bright." 