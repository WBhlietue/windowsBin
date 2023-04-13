$sets = @()
$sets += [System.Tuple]::Create("ANDROID_AVD_HOME", "C:\Users\Administrator\.android\avd");
$sets += [System.Tuple]::Create("ANDROID_HOME", "E:\SDK");
$sets += [System.Tuple]::Create("ANDROID_SDK_ROOT", "E:\SDK");
$sets += [System.Tuple]::Create("JAVA_HOME", "D:\jdk11");
echo $sets

for($i = 0; $i -le $sets.Length-1; $i++){
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v $sets[$i].Item1 /t REG_SZ /d $sets[$i].Item2
}
reg add  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_SZ /d "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;D:\flutter\bin;D:\Git\bin;D:\Git LFS;D:\MinGW\bin;D:\nodejs;D:\Python\Python310;D:\dotnet\;D:\Documents\bin;D:\Microsoft SQL Server\86\150\Tools\Binn\;D:\Microsoft SQL Server\sh\150\Tools\Binn\;D:\Microsoft SQL Server\86\150\DTS\Binn\;D:\Microsoft SQL Server\sh\150\DTS\Binn\;D:\Microsoft SQL Server\sh\Client SDK\ODBC\170\Tools\Binn\;E:\SDK\platform-tools;E:\SDK\tools;D:\apache-maven-3.8.6-bin\apache-maven-3.8.6\bin;D:\php;D:\jdk11\bin;D:\Python\Python310\Scripts;C:\Users\Administrator\.android\avd\;E:\SDK\;D:\Unity\Editor\2021.3.8f1\Editor\Data\PlaybackEngines\AndroidPlayer\SDK\tools;D:\Unity\Editor\2021.3.8f1\Editor\Data\PlaybackEngines\AndroidPlayer\SDK\platform-tools;C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps;C:\Users\Administrator\.dotnet\tools " /f