# Function below
Function Get-MyVms($Server){
Write-Host
Write-Host "Hyper-V Host Server Name is: "
Write-Host $Server
Write-Host
Write-Host "The virtual machine on this server are:"
Get-VM -ComputerName $Server | Select-Object Name}



# Script body starts here
Write-Host
$Server = "win10-bolivar"
Get-MyVms $Server

$Server = "win10-bolivar"
Get-MyVms $Server