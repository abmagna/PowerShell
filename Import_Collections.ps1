#Esses scripts foram retirados da documentação do site Microsoft.

#Script para importar todas as Collections, tando Devices quanto Users.

#Importar todas Collections

Import-CMCollection -ImportFilePath "c:\path\collection.mof"

#Importar todas Users Collections

Import-CMUsersCollections -ImportFilePath "c:\path\collection.mof"

#Importar todas Devices Collections

Import-CMDevicesCollections -ImportFilePath "c:\path\collection.mof"
