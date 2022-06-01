
#First Step - If you wanted to import only one task
#Import one task - Path need to be an UNC path
$FilePath = "\\servername\sharename\nameapp.zip"
Import-CMTaskSequence -ImportFilePath $FilePath 

#First Step - If you wanted to export a bunch of tasks
#Import CSV to choose task will be import
$FilePathCSV = "C:\temp\name.csv"
$var = Import-csv $FilePathCSV -Delimiter ";"

#Second Step - If you want import with Dependency, just erase "IgnoreDependency"
#Loop to import bulk tasks
foreach ($task in $var) {
    
    $name = $task.Name
    $FilePath = "\\servername\sharename\\$name.zip"
    Import-CMTaskSequence -ImportFilePath $FilePath  -IgnoreDependency
}