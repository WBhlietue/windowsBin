$folders = @()
$folders += [System.Tuple]::Create("D:\Documents\TTT", "D:\Documents\bin\TTT");
for($i = 0; $i -le $folders.Length-1; $i++){
    Xcopy $folders[$i].Item1 $folders[$i].Item2 /E /H /C /I
    cmd.exe /c ('rmdir /s /q '+ $folders[$i].Item1)
    cmd.exe /c ('mklink /d /j ' + $folders[$i].Item1 + ' ' + $folders[$i].Item2)
}
# echo $folders