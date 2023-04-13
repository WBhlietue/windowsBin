$a = cmd.exe /c "sc query state=all|findstr /i service_name.*";
$frontText = 14;
$toDemandFrontText = 33


$alwaysAutoStart = "WlanSvc", "Audiosrv"
$alwaysDisable = "SysMain", "SysMain"

$otherDemand =  "icssvc", "icssvc"
$hpServices = "HpTouchpointAnalyticsService", "HPAppHelperCap", "HPDiagsCap", "HPNetworkCap", "HPOmenCap", "HPSysInfoCap"
$hyperVServices = "HvHost", "vmickvpexchange", "vmicguestinterface", "vmicshutdown", "vmicheartbeat", "vmicvmsession", "vmictimesync", "vmicvss"
$intelServices = "IntelAudioService", "cplspcon", "jhi_service", "igccservice", "igfxCUIService2.0.0.0", "LMS", "iaStorAfsService", "RstMwService", "Intel(R) TPM Provisioning Service"

function ToDemand($name){
    $value = (cmd.exe /c ("sc qc " + $name +" | findstr /i start_type.*"))
    if($value -ne $null){
        $value = $value.substring($toDemandFrontText, $value.length - $toDemandFrontText)
        if($value -ne "DISABLED"){
            cmd.exe /c ("sc config " + $name + " start=DEMAND")
        }
    }
}

function ToDisable($name){
    $value = (cmd.exe /c ("sc qc " + $name +" | findstr /i start_type.*"))
    if($value -ne $null){
        $value = $value.substring($toDemandFrontText, $value.length - $toDemandFrontText)
        if($value -ne "DISABLED"){
            cmd.exe /c ("sc config " + $name + " start=DISABLED")
        }
    }
}

function CheckCanToDemand($name){
    for($i = 0; $i -lt $alwaysAutoStart.length; $i++){
        if($name -eq $alwaysAutoStart[$i]){
            return $false;
        }
    }
    return $true
}

function CheckDisables($name){
    for($i = 0; $i -lt $alwaysDisable.length; $i++){
        if($name -eq $alwaysDisable[$i]){
            return $true;
        }
    }
    return $false
}

for($i = 0; $i -lt $a.length; $i ++){
    $service_name =  $a[$i].substring($frontText, $a[$i].length - $frontText)
    if(CheckCanToDemand($service_name)){
        ToDemand($service_name)
    }
}

# for($i = 0; $i -lt $a.length; $i ++){
#     $service_name =  $a[$i].substring($frontText, $a[$i].length - $frontText)
#     if(CheckDisables($service_name)){
#         ToDisable($service_name)
#     }
# }

