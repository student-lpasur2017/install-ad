# Initialisation des variables
$NameNetBios=""
$namedomaine=""

# Affichage des interfaces avec leurs index
Get-NetAdapter

# Installation du service AD
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature

#---------- Deploiement d'une nouvelle foret ----------

# Import module pour avoir les cmdelts de conf pour AD
Import-Module ADDSDeployment

# Lire variables
$namedomaine=Read-Host -Prompt "Quel est le nom de domaine (entre crochet) "
$NameNetBios=Read-Host -Prompt "Quel est le nom du Net Bios (entre crochet, tout en majuscule et sans TLD) "

# Deploiement d'une premiere foret.
  # /!\ Deploiement par script ne fonctionne pas mais par saisie sur powershell cela fonctionne.
Install-ADDSForest -DatabasePath "C:\Windows\NTDS" -DomainMode Win2012R2 -DomainName $namedomain -DomainNetbiosName $NameNetBios -Forestmode Win2012R2 -InstallDns -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion False -SysvolPath "C:\Windows\SYSVOL" -Force
