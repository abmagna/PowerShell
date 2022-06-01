
#First Step - If you wanted to import only one Package
#Import one package - Path need to be an UNC path
$FilePath = "\\servername\sharename\nameapp.zip"
Import-CMPackage -ImportFilePath $FilePath -ImportActionType Skip

#First Step - If you wanted to export a bunch of packages
#Import CSV to choose package will be import
$FilePathCSV = "C:\temp\name.csv"
$var = Import-csv $FilePathCSV -Delimiter ";"

#Second Step
#Loop to import bulk packages
foreach ($pack in $var) {
    
    $name = $pack.PackageID
    $FilePath = "\\servername\sharename\\$name.zip"
    Import-CMPackage -ImportFilePath $FilePath -ImportActionType Skip
}