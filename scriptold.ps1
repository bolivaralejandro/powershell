<#
.SYNOPSIS
This is a server directory script which will scan different server components to determine the current configuration.

.DESCRIPTION
This script will scan processes, Windows services, scheduled tasks, server features, disk information,
registry, and files for pertinent server information.

Author: Alejandro Bolivar / Bolivar, Inc. / Author / bolivaral@gmail.com
Revision : 1.0 - Initial Release of Script / 04-22-2018

.PARAMAMER SDD
This script requires a server side decryptor as a parameter to the script.

.EXAMPLE
script.ps1 /SDD "ServerSideDecryptor"

.NOTES
You must have administrative rights to the server you are scanning. Certian functions will not work properly
without running the script as a system administrator. 
#>

$date = (get-Date -format "yyyyMMddmmss")
$compname = $env:COMPUTERNAME
$logname = $compname + "_" + $date + "_ServerScanScript.log"
$scanresults = "c:\temp\logs\" + $logname
new-item -path $scanresults -ItemType File -Force
