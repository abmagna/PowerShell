Import-Module ActiveDirectory
$FilePathCSV = "C:\temp\subnet.csv"
$var = Import-csv $FilePathCSV -Delimiter ","

foreach ($subnet in $var) {
    
    $name = $subnet.Subnet
    $location = $subnet.Location
    $site = $subnet.Site
    New-ADReplicationSubnet -Name "$name" -Site $site -Location "$location" -OtherAttributes @{'location'= "$location"} -verbose
}