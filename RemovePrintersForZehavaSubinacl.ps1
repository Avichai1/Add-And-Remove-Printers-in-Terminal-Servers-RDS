$server = $quote + (Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address).IPAddressToString + $quote
$allprinters = Get-Printer -ComputerName $server | Select Name -ExpandProperty name
$printers_zehava_need = @("Samsung-Mazkira", "Samsung-G.R-IsraelaC", "Microsoft Print to PDF", "Samsung-Tirat-Carmel", "Samsung-Sachar2")
$printerpermissiondeny_part1 = "C:\Users\Administrator.MAOF-GROUP\Desktop\subinacl /print "
$printerpermissiondeny_part2 = " /deny="
$printerpermissiondeny_part3 = '"maof-group\zehavas=F"'
$quote = '"'
Foreach($printer in $allprinters)
{
     $printer_permission_deny = $printerpermissiondeny_part1+$quote+$printer+$quote+$printerpermissiondeny_part2+$printerpermissiondeny_part3
     Write-Output $printer_permission_deny
}    