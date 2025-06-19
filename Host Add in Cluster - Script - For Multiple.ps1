#####################################################################
# Load VMware Plugins and connect to vCenter
#####################################################################

Add-PSSnapin vmware.vimautomation.core
## Enter your vCenter here
connect-viserver -server VCS-001-US-001
$vCenter="VCS-001-US-001"
$vcenteruser="administrator@vcs-sso.local"
$vCenterUserPassword="C0nv3nt1on$"
########################################################################
# Add Multiple Hosts to vCenter
########################################################################

# Variables
## You can use comma separated names or change to pull from a text file. Your pick.
$ESXiHosts = "VSH-001-US-103" , "VSH-001-US-104" , "VSH-001-US-105" , "VSH-001-US-106" , "VSH-001-US-107" , "VSH-001-US-108" , "VSH-001-US-109" , "VSH-001-US-110" , "VSH-001-US-111" , "VSH-001-US-112" , "VSH-001-US-113" , "VSH-001-US-114" , "VSH-001-US-115" , "VSH-001-US-116" , "VSH-001-US-117" , "VSH-001-US-147"
## Enter the name of a Data Center or Host Cluster
$ESXiLocation = "H5_ECM_PROD_12"

# Start Script
$credentials = Get-Credential -UserName root -Message "Enter the ESXi root password"

Foreach ($ESXiHosts in $ESXiHosts) {
Add-VMHost -Name $ESXiHosts -Location $ESXiLocation -User $credentials.UserName -Password $credentials.GetNetworkCredential().Password -RunAsync -force
Write-Host -ForegroundColor GREEN "Adding ESXi host $ESXiHosts to vCenter"
}
# End Script