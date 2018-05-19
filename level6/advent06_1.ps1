$instructions = Get-Content level6.txt
$table = New-Object "bool[,]" 1000,1000
[regex]$checker = "^.*(.) ([0-9]{1,3}),([0-9]{1,3}) through ([0-9]{1,3}),([0-9]{1,3})"
[int]$count = 0

function Set-Rectangle ([ref]$table, [int]$x1, [int]$y1, [int]$x2, [int]$y2, [bool]$val)
{ 
  for ($i = $x1; $i -le $x2; $i++)
  {
    for ($j = $y1; $j -le $y2; $j++)
    {
      $table.Value[$i,$j] = $val
    }
  }
}

function Toggle-Rectangle ([ref]$table, [int]$x1, [int]$y1, [int]$x2, [int]$y2)
{ 
  for ($i = $x1; $i -le $x2; $i++)
  {
    for ($j = $y1; $j -le $y2; $j++)
    {
      $table.Value[$i,$j] = !$table.Value[$i,$j] 
    }
  }
}

ForEach ($_ in $instructions)
{
  if ($_ -match $checker)
  {
    switch ($matches[1])
    {
      "n" { Set-Rectangle ([ref]$table) $matches[2] $matches[3] $matches[4] $matches[5] $true } 
      "f" { Set-Rectangle ([ref]$table) $matches[2] $matches[3] $matches[4] $matches[5] $false }
      "e" { Toggle-Rectangle ([ref]$table) $matches[2] $matches[3] $matches[4] $matches[5] }
    }
  }
}

ForEach ($_ in $table)
{
  if ($_ -eq $True)
  {
    $count++
  }
}

Write-Host "There are $count lights on."