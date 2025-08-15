<#
.SYNOPSIS
    This PowerShell script ensures Windows 10 account lockout duration is configured to 15 minutes or greater

.NOTES
    Author          : Musie Berhe
    LinkedIn        : 
    GitHub          : github.com/cyberpropirate
    Date Created    : 2025-08-14
    Last Modified   : 2025-08-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AC-000005).ps1 
#>

# YOUR CODE GOES HERE
# Ensure script is run as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You must run this script as Administrator!"
    exit 1
}

# Set Account Lockout Threshold (just to ensure the lockout is active)
net accounts /lockoutthreshold:3

# Set Account Lockout Duration to 15 minutes
net accounts /lockoutduration:15

# Optional: Set Reset Account Lockout Counter to 15 minutes (recommended)
net accounts /lockoutwindow:15

Write-Output "Account lockout policies have been set:"
net accounts
