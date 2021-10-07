Servers = ["192.168.1.36",
            "192.168.1.37",
            "192.168.1.38",
            "192.168.1.45",
            "192.168.1.47",
            "192.168.1.48",
            "192.168.1.49",
            "192.168.1.50",
            "192.168.1.51",
            "192.168.1.52",
            "192.168.1.53",
            "192.168.1.54",
            "192.168.1.55",
            "192.168.1.56",
            "192.168.1.57",
            "192.168.1.58",
            "192.168.1.59",
            "192.168.1.60",
            "192.168.1.61",
            "192.168.1.62"
           ]




Server = ["192.168.1.37"]
Permissions = ["student2"]
Printer_Name = "Samsung-hinuch-office"
for server in Servers:
    printerpermission_part1 = r"\\192.168.1.36\c$\Users\Administrator.MAOF-GROUP\Desktop\subinacl /print "
    printer = r"\\" + server + "\\" + Printer_Name
    for permission in Permissions:
        #Grant Permissions
        printerpermission_part2 = " /grant="
        printerpermission_part3 = "MAOF-GROUP\\" + permission + "=p"
        Printer_Permission_Grant = printerpermission_part1+printer+printerpermission_part2+printerpermission_part3
        print(Printer_Permission_Grant)
        #Revoke Permissions
        printerpermission_Revoke_part2 = " /revoke="
        printerpermission_Revoke_part3 = "MAOF-GROUP\\" + permission
        Printer_Permission_Revoke = printerpermission_part1+printer+printerpermission_Revoke_part2+printerpermission_Revoke_part3
        #print(Printer_Permission_Revoke)

    add_administrator_permission = r"\\192.168.1.36\c$\Users\Administrator.MAOF-GROUP\Desktop\subinacl /print " +printer+ " /grant=MAOF-GROUP\Administrator=F"
    #delete_everyone_permission = r"C:\Users\Administrator.MAOF-GROUP\Desktop\subinacl /print " + printer + " /revoke = Everyone"
    print(add_administrator_permission)
    #print(delete_everyone_permission)