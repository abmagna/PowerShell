#Import module Configure Manager - Choose the disk on which CM was installed
Import-Module "DISKNAME:\Program Files\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1"
#If it is not within the site code, use this cmdlet
Set-Location sitecode: 

#First Step - If you wanted to export only one package
#Export one Package cmdlet with Related apps and Content
Get-CMPackage -Name "Package name" | Export-CMPackage -FileName "C:\Path\Package.zip" -WithContent $true -Force

#First Step -  If you wanted to export a bunch of packages
#Export packages with Name property to CSV
$FilePath = "C:\temp\name.csv" 
Get-CMPackage | Select-Object PackageID | Export-CSV $FilePath -notypeinformation -append -delimiter ";"

#Second Step
#Import CSV to choose packages will be export 
$FilePathCSV = "C:\temp\name.csv"
$var = Import-csv $FilePathCSV -Delimiter ";"

#Third Step
#Loop to export bulk packages
foreach ($pack in $var) {
    
    $name = $pack.PackageID
    Get-CMPackage -PackgeID $name -Fast |Export-CMPackage -FileName "C:\temp\$name.zip" -WithContent $true -Force    
}




