
#First Step - If you wanted to import only one application
#Import one application - Path need to be an UNC path
$FilePath = "\\servername\sharename\nameapp.zip"
Import-CMApplication -FilePath $FilePath -ImportActionType DirectImport

#First Step - If you wanted to export a bunch of application
#Import CSV to choose applications will be import
$FilePathCSV = "C:\temp\name.csv"
$var = Import-csv $FilePathCSV -Delimiter ";"

#Second Step
#Loop to import bulk application
foreach ($app in $var) {
    
    $name = $app.LocalizedDisplayName
    $FilePath = "\\MAGNA-CM01\UpdateServicesPackages\$name.zip"
    Import-CMApplication -FilePath $FilePath -ImportActionType DirectImport
}