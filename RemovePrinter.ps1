$Servers = @()#רשימת שרתים
$portName = "" #השם של הפורט
$PrinterName = "" #השם של המדפסת
Foreach($Server in $Servers)
{
    Remove-PrinterPort -name $portName -ComputerName $Server 
    Remove-Printer -Name $PrinterName -ComputerName $Server 
}