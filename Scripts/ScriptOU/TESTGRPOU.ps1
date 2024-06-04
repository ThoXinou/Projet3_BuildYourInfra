﻿$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

### Fichier a récupérer
$File = "$FilePath\CSVfinal2.csv"

### Initialisaiton

If (-not(Get-Module -Name activedirectory))
{
    Import-Module activedirectory
}
# Imporation des données
$Users = Import-Csv -Path $File -Delimiter "," -Header "Prenom", "Nom", "Societe", "Site", "Departement", "Service", "fonction", "ManagerPrenom", "ManagerNom", "PC", "DateDeNaissance", ` "Telf", "Telp", "Nomadisme - Télétravail" | Select-Object -Skip 1
$ADUsers = Get-ADUser -Filter * -Properties *
$Count = 1
Foreach ($User in $Users)
{
    Write-Progress -Activity "Création des utilisateurs dans les OU" -Status "% effectué" -PercentComplete ($Count/$Users.Length*100)
    $Name              = "$($User.Nom) $($User.Prenom)"
    $DisplayName       = "$($User.Nom) $($User.Prenom)"
    $SamAccountName    = $($User.Prenom.ToLower())+ "." + $($User.Nom.ToLower())
    $UserPrincipalName = $(($User.Prenom.ToLower() + "." + $User.Nom.ToLower()) + "@" + (Get-ADDomain).Forest)
    $GivenName         = $User.Prenom
    $Surname           = $User.Nom
    $OfficePhone       = $User.Telf
    $PortablePhone     = $User.Telp
    $EmailAddress      = $UserPrincipalNameBi
    $Path              = "ou=$($User.Service),ou=$($User.Departement),ou=BillU-Users,dc=BILLU,dc=lan"
    $Department        = "$($User.Departement)"
    $Service           = "$($User.Service)"
    $Fonction          = "$($User.fonction)"
    $Company           = $User.Societe
    $Manager           = $($User.ManagerNom.ToLower())+ "." + $($User.ManagerPrenom.ToLower())
    $ManagerPrenom     = $User.ManagerPrenom
    $ManagerNom        = $User.ManagerNom
    $Site              = $User.Site
    $birthday          = $User.DateDeNaissance
}
       # Gestion de présence de Sous OU
        if ( $User.Service -eq "NA" )
        # Chemin complet
        {
                $Path = "ou=$($User.Departement),ou=BillU-Users,dc=BILLU,dc=lan"
        }
        Else
        # Chemin sans sous OU
        {
                $Path = "ou=$($User.Service),ou=$($User.Departement),ou=BillU-Users,dc=BILLU,dc=lan"      
        }

        # Création Utilisateur
    If (($ADUsers | Where {$_.SamAccountName -eq $SamAccountName}) -eq $Null)
    {
        Try
        {
            New-ADUser -Name $Name -DisplayName $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName `
            -GivenName $GivenName -Surname $Surname -HomePhone $OfficePhone -MobilePhone $PortablePhone -EmailAddress $EmailAddress `
            -Office $Site -Description $birthday -Title $Fonction -City $Site -Path $Path `
            -AccountPassword (ConvertTo-SecureString -AsPlainText Azerty12024* -Force) -Enabled $True `
            -OtherAttributes @{Company = $Company;Department = $Department} -ChangePasswordAtLogon $True
           
            Write-Host "Création du USER" $SamAccountName -ForegroundColor Green
        }
        Catch  
        {
            write-host "Création du USER" $SamAccountName  "échoué" -ForegroundColor red

        }
    }
    Else
    {
        Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Yellow
    }
     
    $Count++
    sleep -Milliseconds 100
