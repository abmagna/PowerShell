#Import module Configure Manager - Choose the disk on which CM was installed
Import-Module "DISKNAME:\Program Files\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1"
#If it is not within the site code, use this cmdlet
Set-Location sitecode: 

#First Step - If you wanted to export only one driver 
#Export one driver cmdlet with Contents and Dependence
Get-CMDriverPackage -Name "Network USB" -Fast| Export-CMDriverPackage -ExportFilePath "C:\Path\AppName.zip" -WithContent $true 
-WithDependence $true -Force

#First Step - If you wanted to export a bunch of drivers
#Export packages with Name property to CSV
$FilePath = "C:\temp\name.csv" 
Get-CMDriverPackage | Select-Object Name | Export-CSV $FilePath -notypeinformation -append -delimiter ";"

#Second Step
#Import CSV to choose drivers will be export 
$FilePathCSV = "C:\temp\name.csv"
$var = Import-csv $FilePathCSV -Delimiter ";"

#Third Step 
#Loop to export bulk driver packages
foreach ($driver in $var) {
    
    $name = $driver.Name
    Get-CMDriverPackage -Name "$name" -Fast| Export-CMDriverPackage -ExportFilePath "C:\Users\265414571\Desktop\DriversPack\$name.zip" -WithContent $true -WithDependence $true -Force 
}
