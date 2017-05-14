# Affichage des interfaces avec leurs index
Get-NetAdapter

# Installation du service AD
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature

#---------- Deploiement d'une nouvelle foret ----------

# Import module pour avoir les cmdelts de conf pour AD
Import-Module ADDSDeployment
# /!\ Commande a tester et a la rendre dynamique si possible
Install-ADDSForest -DatabasePath "C:\Windows\NTDS" -DomainMode "Win2012R2" -DomainName "mycompany.com" -DomainNetbiosName "MYCOMPANY" -Forestmode "Win2012R2" -InstallDns True -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion False -SysvolPath "C:\Windows\SYSVOL" -Force True
