<#
.SYNOPSI
    This PowerShell script ensures camera access from the lock screen is disabled.

.NOTES
    Author          : Musie Berhe
    LinkedIn        : 
    GitHub          : github.com/cyberpropirate
    Date Created    : 2024-08-14
    Last Modified   : 2024-08-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000005).ps1 
#>

# YOUR CODE GOES HERE# Run this script as Administrator

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Ensure the key exists
If (-Not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the 'NoLockScreenCamera' DWORD value to 1
New-ItemProperty -Path $registryPath -Name "NoLockScreenCamera" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "Registry key successfully created or updated."
