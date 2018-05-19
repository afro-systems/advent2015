function Find-Password($in)
{
    Write-Host $in
    $valid = Validate-String $in
    $count = 0;
    if ($valid -eq 1)
    {
        Write-Output "Already valid password."
    }
    else
    {
        while ($valid -eq -1)
        {
          #  "mutating $in`n"
            [string]$in = Mutate-String $in
           # "checking $in`n"
            $valid = Validate-String $in
            if ($valid -eq 1)
            {
                $in
            }
            $count++
            if ($count % 10000 -eq 1)
            {
                $in
            }
        }
        if ($valid -eq 1)
        {
            $in
        }
    }

}

function Mutate-String ([string]$str)
{
    #hepxryz -> hepxrza

    #increment password once
        #increase the rightmost letter one step UNLESS it is 'z'
            #if z, then wrap around to 'a' and increment previous letter
            #if previous letter z, wrap to 'a' and increment previous letter

    $strArray = $str.ToCharArray();
    $i = $str.length - 1
    $changed = 0
    while ($strArray[$i] -eq 'z')
    {
        if ($i -lt 0)
        {
            return $strArray -join ""
        }
        $strArray[$i] = 'a'
        $changed = 1
        $i--
        if ($strArray[$i] -ne 'z')
        {
            $strArray[$i] = [char] ([int]([char]$strArray[$i]) + 1)
            break
        }
    }
    if (($i -eq ($str.length-1)) -and ($changed -eq 0))
    {
        $strArray[$i] = [char] ([int]([char]$strArray[$i]) + 1)
    }
    return $strArray -join ""
}

function Validate-String([string]$str)
{
    #check for the one increasing straight of at least 3 letters
    if ($str.Length -ne 8)
    {
        return -1
    }
    $passtest1 = 0
    $passtest2 = 1
    $passtest3 = 0
    for ($i = 0; $i -lt ($str.length -3); $i++)
    {
        if (($str[$i] -eq ($str[$i+1] - 1)) -and ($str[$i] -eq ($str[$i+2] - 2)))
        {
            $passtest1 = 1
        }
    }
    if ($passtest1 -ne 1)
    {
        return -1
    }
    #check that no i, o, or l
    for ($i = 0; $i -lt ($str.length); $i++)
    {
        if (($str[$i] -eq 'i') -or ($str[$i] -eq 'o') -or ($str[$i] -eq 'l'))
        {
            $passtest2 = 0
            return -1
        }
    }
    #check for first pair
    for ($i = 0; $i -lt (($str.length)-1); $i++)
    {
        if($str[$i] -eq $str[$i+1])
        {
            #match found, check for 2nd pair
            for ($j = $i+2; $j -lt (($str.length) - 1); $j++)
            {
                if ($str[$j] -eq $str[$j+1])
                {
                    Write-Host  "Second $str match found at $j."
                    $passtest3 = 1
                }
            }
        }
    }
    #"test 1: $passtest1, test 2: $passtest2, test 3: $passtest3"
    if (($passtest1 -eq 1) -and ($passtest2 -eq 1) -and ($passtest3 -eq 1))
    {
        Write-Host "Test passed on $str."
         return 1
    }
    else
    {
        return -1
    }
}