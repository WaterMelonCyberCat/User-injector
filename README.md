# User Injector

This repository contains a PowerShell script for automating the creation of Active Directory (AD) user accounts based on data provided in CSV files. 

The script supports importing both regular users and admin users into specified Organizational Units (OUs) in your Active Directory.

## Repository Structure

- **usersdeployement.ps1**: The main PowerShell script for importing users into Active Directory.
- **user.csv/**:
  - `users.csv`: Contains data for regular users (first name, last name, and password).
  - `users_admin.csv`: Contains data for admin users (first name, last name, and password).
- **image/**: Contains images related to the script, such as screenshots or diagrams.
- **README.md**: This file, which explains the repository and how to use it.

## Prerequisites

1. Ensure you have the Active Directory module installed on your system.
2. You must have the necessary permissions to create users in the specified OUs in your Active Directory.
3. Update the file paths in the script (`usersdeployement.ps1`) to point to the correct locations of your CSV files.

## How to Use

1. **Download the Script**:
   - If the script is hosted online, you can download it using the `Invoke-WebRequest` command in PowerShell. For example:
     ```powershell
     Invoke-WebRequest -Uri "https://example.com/usersdeployement.ps1" -OutFile "usersdeployement.ps1"
     ```
   - Replace `"https://example.com/usersdeployement.ps1"` with the actual URL where the script is hosted.

2. **Prepare the CSV Files**:
   - Populate `users.csv` with the details of regular users.
   - Populate `users_admin.csv` with the details of admin users.
   - Each file should have the following columns: `first_name`, `last_name`, and `Password`.

3. **Update the Script**:
   - Open [usersdeployement.ps1](http://_vscodecontentref_/1).
   - Update the `$adminFilePath` and `$userFilePath` variables with the paths to your `users_admin.csv` and `users.csv` files, respectively.
   - Update the `$adminOU` and `$normalOU` variables with the distinguished names (DNs) of the OUs where you want to create the users.

4. **Run the Script**:
   - Open PowerShell with administrative privileges.
   - Navigate to the directory containing the script using the `cd` command. For example:
     ```powershell
     cd c:\Users\hicha\GitHub-WMCC\user-injector
     ```
   - Execute the script by running:
     ```powershell
     .\usersdeployement.ps1
     ```
   - The script will read the data from the CSV files and create the users in the specified OUs.

5. **Verify the Results**:
   - Check your Active Directory to ensure the users have been created successfully.
   - The script will output messages indicating the success of each user creation.

## Notes

- Passwords in the CSV files must meet your Active Directory's password complexity requirements.
- Ensure the CSV files are properly formatted to avoid errors during the import process.

## Disclaimer

Use this script with caution, especially in production environments. Test thoroughly in a development or staging environment before deploying to production.