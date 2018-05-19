function Get-LookAndSay ($n = 1) {
    $re = [regex] '(.)\1*'
    $ret = ""
    foreach ($m in $re.Matches($n)) {
        $ret += [string] $m.Length + $m.Value[0]
    }
    return $ret
}

function Get-MultipleLookAndSay ($a, $n+1) {
        for ($i = 1; $i -lt $n; $i++) {
            $a = Get-LookAndSay $a
            $a.Length
        }
    }
}