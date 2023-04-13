$folders = @()
$folders += [System.Tuple]::Create("C:\Users\Administrator\.android", "E:\.android");
$folders += [System.Tuple]::Create("C:\Users\Administrator\AppData\Local\Unity", "D:\Unity\Data\Unity");

for($i = 0; $i -le $folders.Length-1; $i++){
    cmd.exe /c ('rmdir /s /q '+ $folders[$i].Item1)
    cmd.exe /c ('mklink /d /j ' + $folders[$i].Item1 + ' ' + $folders[$i].Item2)
}
# echo $folders