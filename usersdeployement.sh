# Importation du module Active Directory
Import-Module ActiveDirectory

# Chemin des fichiers CSV
$adminFilePath = "C:\Path\to\users_admin.csv"
$userFilePath = "C:\Path\to\users.csv"

# Importation des données depuis les fichiers CSV
$adminUsers = Import-Csv -Path $adminFilePath
$normalUsers = Import-Csv -Path $userFilePath

# OU des utilisateurs
$adminOU = "OU=utilisateurs admins,DC=mondomaine,DC=com"
$normalOU = "OU=utilisateurs,DC=mondomaine,DC=com"

# Importation des utilisateurs admins
foreach ($user in $adminUsers) {
    $username = "$($user.first_name).$($user.last_name)" # Génération du nom d'utilisateur
    $password = ConvertTo-SecureString -String $user.Password -AsPlainText -Force
    New-ADUser -SamAccountName $username `
               -UserPrincipalName "$username@mondomaine.com" `
               -Name "$($user.first_name) $($user.last_name)" `
               -GivenName $user.first_name `
               -Surname $user.last_name `
               -DisplayName "$($user.first_name) $($user.last_name)" `
               -AccountPassword $password `
               -Enabled $true `
               -Path $adminOU `
               -Description "Administrateur" `
               -PassThru
    Write-Host "Utilisateur admin $username importé avec succès."
}

# Importation des utilisateurs normaux
foreach ($user in $normalUsers) {
    $username = "$($user.first_name).$($user.last_name)" # Génération du nom d'utilisateur
    $password = ConvertTo-SecureString -String $user.Password -AsPlainText -Force
    New-ADUser -SamAccountName $username `
               -UserPrincipalName "$username@mondomaine.com" `
               -Name "$($user.first_name) $($user.last_name)" `
               -GivenName $user.first_name `
               -Surname $user.last_name `
               -DisplayName "$($user.first_name) $($user.last_name)" `
               -AccountPassword $password `
               -Enabled $true `
               -Path $normalOU `
               -Description "Utilisateur classique" `
               -PassThru
    Write-Host "Utilisateur $username importé avec succès."
}
