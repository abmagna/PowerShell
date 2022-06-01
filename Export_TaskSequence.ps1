#Import module Configure Manager - Choose the disk on which CM was installed
Import-Module "DISKNAME:\Program Files\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1"
#If it is not within the site code, use this cmdlet
Set-Location sitecode:

#First Step - If you wanted to export only one task
#Export one driver cmdlet with Contents and Dependence
Get-CMTaskSequence -Name "1-PRD-Argentina-W10x64-OFC365" -Fast | Export-CMTaskSequence -ExportFilePath "C:\path\teste.zip" 
-WithContent $true -WithDependence $true

#First Step - If you wanted to export a bunch of tasks
#Export apps with Name property to CSV
$FilePath = "C:\temp\name.csv" 
Get-CMTaskSequence | Select-Object Name | Export-CSV $FilePath -notypeinformation -append -delimiter ";"

#Second Step
#Import CSV to choose tasks will be export 
$FilePathCSV = "C:\temp\name.csv"
$var = Import-csv $FilePathCSV -Delimiter ";"

#Loop to export bunk of task sequence
foreach ($task in $var) {
    
    $name = $task.Name
    Get-CMTaskSequence -Name "$name" -Fast| Export-CMTaskSequence -ExportFilePath "C:\path\$name.zip" -WithContent $true -WithDependence $true -Force 
}