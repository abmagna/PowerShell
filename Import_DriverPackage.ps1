
#First Step - If you wanted to import only one driver
#Import one package - Path need to be an UNC path
$FilePath = "\\servername\sharename\nameapp.zip"
Import-CMDriverPackage -ImportFilePath $FilePath -ImportActionType DirectImport

#First Step - If you wanted to export a bunch of drivers
#Import CSV to choose package will be import
$FilePathCSV = "C:\temp\name.csv"
$var = Import-csv $FilePathCSV -Delimiter ";"

#Second Step
#Loop to import bulk drivers packages
foreach ($driver in $var) {
    
    $name = $driver.Name
    $FilePath = "\\servername\sharename\\$name.zip"
    Import-CMDriverPackage -ImportFilePath $FilePath -ImportActionType DirectImport
}