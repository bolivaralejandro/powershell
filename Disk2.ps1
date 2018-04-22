$Username = "Livelessons\Administrator"
$Password = Get-Content C:\Scripts\password.txt | ConvertTo-SecureString

$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $Password
Get-WmiObject Win32_DiskDrive -ComputerName "Liberman-2012R2GUI.livelessons.local" -Credential $Cred