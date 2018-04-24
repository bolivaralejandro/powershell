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
$logname = $compname + "_" + $date + "_ServerScanScript.csv"
$scanresults = "c:\temp\logs\" + $logname
new-item -path $scanresults -ItemType File -Force

# Add Content Headers to the CSV File
$csvheader = "ServerName, Classification, Other Data"
Add-Content -path $scanresults -Value $csvheader

function log { param($string, $scnlg, $evntlg)
	# if Y is populated in the second position, add to log file.
	if ($scnlg -like "Y") {
	   Add-content -path $scnlg -Value $string
       	}
	# if Y is populated in the third position, Log Item to Event Log as well
  	if ($evntlg -like "Y") {
	   write-eventlog -logname Application -source ".\script.ps1" -eventID 1000 -entrytype Information -message "$string"
	}
	# if there are no paramaters specified, write to the data collection file (CSV)
	if (!$scnlg) {
	   $content = "$env:COMPUTERNAME,$string"
	   Add-Content -path $scanresults -Value $content
	}
	# Verbose Logging
	write-host $string
}

$date = Get-Date
log "Starting script at $date ..." "Y" "Y"
log "Writing a message to the Event Log Only." "N" "Y"
log "Script Start, $date"
