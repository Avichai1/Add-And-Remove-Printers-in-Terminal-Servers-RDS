$Servers = @()#רשימת שרתים
$PortIP = "" #האייפי של המדפסת 
$portName = "" #השם של הפורט
$portNumber = ""
$printDriverName = "" #השם של הדרייבר
$PrinterName = "" #השם של המדפסת
Foreach($Server in $Servers)
{
        $portExists = Get-Printerport -Name $portname -ComputerName $Server -ErrorAction SilentlyContinue #בודק פורטים קיימים
    if (-not $portExists) { #אם לא קיים פורט כזה
      Add-PrinterPort -name $portName -ComputerName $Server -PrinterHostAddress $PortIP -PortNumber $portNumber  #מוסיף את הפורט
    }
    $printDriverExists = Get-PrinterDriver -name $printDriverName -ComputerName $Server -ErrorAction SilentlyContinue #בודק דרייברים קיימים
    if ($printDriverExists) {
        Add-Printer -Name $PrinterName -ComputerName $Server -PortName $portName -DriverName $printDriverName #אם הדרייבר קיים מוסיף את המדפסת
    }else{
        Write-Warning $Server + "Printer Driver not installed" #אם לא מוסיף מראה שגיאה שאומרת שהדרייבר לא קיים
    }
}