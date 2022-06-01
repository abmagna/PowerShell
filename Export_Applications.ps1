
#Import module Configure Manager - Choose the disk on which CM was installed
Import-Module "DISKNAME:\Program Files\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1"
#If it is not within the site code, use this cmdlet
Set-Location sitecode: 

#First Step - If you wanted to export only one application without content
#Export one application cmdlet just zip file
Get-CMApplication "App name" | Export-CMApplication -Path "C:\Path\AppName.zip" 
-IgnoreRelated -OmitContent -Comment "Application export" -Force

#First Step - If you wanted to export only one application 
#Export one application cmdlet with Related apps and Content
Get-CMApplication "App name" | Export-CMApplication -Path "C:\Path\AppName.zip" 
-Comment "Application export" -Force

#First Step - If you wanted to export a bunch of application
#Export apps with LocalizedDisplayName property to CSV
$FilePath = "C:\temp\name.csv" 
Get-CMApplication | Select-Object LocalizedDisplayName | Export-CSV $FilePath -notypeinformation -append -delimiter ";"

#Second Step
#Import CSV to choose applications will be export 
$FilePathCSV = "C:\temp\name.csv"
$var = Import-csv $FilePathCSV -Delimiter ";"

#Third Step 
#Loop to export bulk application
foreach ($app in $var) {
    
    $name = $app.LocalizedDisplayName
    Get-CMApplication $name |Export-CMApplication -Path "C:\temp\$name.zip" -Comment "Application export" -Force    
}


