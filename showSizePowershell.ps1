$ErrorActionPreference = "stop"

function ToDes($num){
    return [Math]::Floor($num*100) / 100 
}

$a = (ls -force).Name

$b = "B", "KB", "MB", "GB", "TB"

$c = @()
for($i = 0; $i -le $a.Length-1; $i++){
    try{
    $size = (ls $a[$i] -r | measure -sum Length).Sum 
    if($size -eq $null){
        $size = 0
    }
    $c += [System.Tuple]::Create($a[$i], $size)
    }
    catch [Exception]
    {}
    finally{}
}
$c = $c | Sort-Object -Property   @{Expression = "Item2"; Descending = $true}

$d = @()

for($i = 0; $i -lt $c.Length; $i++){
    $back = "B"
    $n = 0
    $size = $c[$i].Item2;
    while($size -ge 1024){
        $n++;
        $back = $b[$n]
        $size /= 1024
        $size = ToDes($size)
    }
    $d += [System.Tuple]::Create($c[$i].Item1,$size, $back)
}

echo $d

