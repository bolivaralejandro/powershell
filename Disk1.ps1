$Cred = Get-Credential
Get-WmiObject Win32_DiskDrive -ComputerName "win10-bolivar" $Cred