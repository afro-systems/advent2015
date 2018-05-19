$ErrorActionPreference = "SilentlyContinue"

$inputObj = Get-Content ./input.txt

$parse = ConvertFrom-Json -InputObject $inputObj

function Get-NestedArray ($arrayObj)
{
    foreach($element in $arrayObj)
    {
        if ($element.gettype().name -eq 'PSCustomObject' -and $element -notmatch 'red')
        {
            Get-NestedObject $element
        }
        elseif ($element.gettype().name -eq 'Object[]')
        {
            Get-NestedArray $element
        }
        elseif ($element.gettype().name -eq 'Int64')
        {
            $element
        }
    }
}

function Get-NestedObject ($jsonObject)
{
    $parseObj = $jsonObject | Get-Member

    foreach ($type in $parseObj)
    {
        if ($type.MemberType -eq 'NoteProperty')
        {
            switch ($jsonObject.($type.Name))
            {
                {$_.gettype().name -eq 'PSCustomObject' -and $_ -notmatch 'red'} 
                    {
                        Get-NestedObject $_
                    }
                {$_.gettype().name -eq 'Object[]'} 
                    {
                        foreach ($arr in $_)
                        {
                            if ($arr.gettype().name -eq 'Int64')
                            {
                                $arr
                            }
                            elseif ($arr.gettype().name -eq 'PSCustomObject' -and $arr -notmatch 'red')
                            {
                                Get-NestedObject $arr
                            }
                            elseif ($arr.gettype().name -eq 'Object[]')
                            {
                                Get-NestedArray $arr
                            }
                        }
                    }
                {$_.gettype().name -eq 'Int64'}
                    {
                        $_
                    }
            }
        }
    }
}

Get-NestedObject $parse