$HashTable = @{}; $count = 0;

function Get-Valid ($instruction) {  
    !$instruction.Done -and 
    (($instruction.Val1 -match "[0-9]+" -or $HashTable.ContainsKey($instruction.Val1)) -and 
    (!$instruction.Val2 -or $instruction.Val2 -match "[0-9]+" -or $HashTable.ContainsKey($instruction.Val2)))
}

function Get-Value ($x)
{ 
    if ($x -match "[0-9]+")
    { 
        [int]$x 
    } 
    else 
    { 
        $HashTable[$x]
    }
}

$instructions = Get-Content ./level7.txt | 
  ForEach-Object { $_ -replace "(.*) -> (.*)", '$2,$1' } | 
  ForEach-Object { $_ -replace ",(.*) ([A-Z]+) (.*)",',$2,$1,$3'  } | 
  ForEach-Object { $_ -replace ",([A-Z]*) (.*)",',$1,$2' } | 
  ForEach-Object { $_ -replace '^([a-z]*),([0-9a-z]*)$','$1,ASSIGN,$2'} | 
  ConvertFrom-Csv -Header Def,Op,Val1,Val2,Done 

while ($count -lt $instructions.Length)
{ 
    $instructions | Where-Object{ (Get-Valid $_) } | 
    ForEach-Object { 
        $circuit = $_ 
        $HashTable[$circuit.Def] = switch($circuit.Op)
        {
            "NOT" { -bnot (Get-Value $circuit.Val1) }
            "AND" { (Get-Value $circuit.Val1) -band (Get-Value $circuit.Val2) }
            "OR" { (Get-Value $circuit.Val1) -bor (Get-Value $circuit.Val2) }
            "LSHIFT" { (Get-Value $circuit.Val1) -shl (Get-Value $circuit.Val2) }
            "RSHIFT" { (Get-Value $circuit.Val1) -shr (Get-Value $circuit.Val2) }
            "ASSIGN" { (Get-Value $circuit.Val1) }
        }
        $circuit.Done = $true
        $count++
    } 
}

$HashTable["a"] 