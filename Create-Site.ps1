Import-Module ActiveDirectory
$FilePathCSV = "C:\temp\site.csv"
$var = Import-csv $FilePathCSV -Delimiter ","

foreach ($site in $var) {
    
    $name = $site.SiteName
    $location = $site.location
    New-ADReplicationSite -Name "$name" -OtherAttributes @{'location'= "$location"} -verbose
}