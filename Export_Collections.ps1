
#These scripts are taken from Microsoft documentation.

#Script to export all Collections, both Devices and Users.
#To Export, just enter the Path where you want to export the Collections.

$allColl = Get-CMCollection

foreach ( $coll in $allcoll ) {
  Export-CMCollection -InputObject $coll -ExportFilePath "D:\Export\Collections\$($coll.Name).mof"
}

#Script to export Users Collections.
#To Export, just enter the Path where you want to export the Collections.

$allColl = Get-CMUserCollection

foreach ( $coll in $allcoll ) {
  Export-CMUserCollection -InputObject $coll -ExportFilePath "C:\Users\CMAdmin\Desktop\teste_amb\$($coll.Name).mof"-Force
}

#Script to export Devices Collections.
#To Export, just enter the Path where you want to export the Collections.

$allColl = Get-CMDeviceCollection

foreach ( $coll in $allcoll ) {
  Export-CMDeviceCollection -InputObject $coll -ExportFilePath "C:\Users\CMAdmin\Desktop\teste_amb\$($coll.Name).mof" -Force
}