[CmdletBinding()]
Param
(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateScript({Test-Path $_ })]
    [String]$CertificatePath,
    [Parameter(Mandatory=$false, Position=1)]
	[String]$Keyword,
    [Parameter(Mandatory=$false, Position=2)]
    [String]$ByComputerName
    # [Switch]$Export,
    # [Switch]$DisplayAllCertificates
)

Begin
{
	$csv = $null;
    $compArray = @();
}

Process
{
    $csv = Import-Csv $CertificatePath;

    if($ByComputerName -ne "")
    {
        forEach($object in $csv)
        {
            if($object.PSComputerName -like "*$ByComputerName*")
            {
                $compArray += $object;
            }
        }

        if($Keyword -eq "")
        {
            foreach($arrayObject in $compArray)
            {
                Write-Output($arrayObject);
            }
        }
    }
    
    if($Keyword -ne "")
    {
        if($compArray -ne $null)
        {
            foreach($arrayObject in $compArray)
            {
                if($arrayObject.subject -like "*$Keyword*")
                {
                    Write-Output($arrayObject);
                }
            }
        }
        else
        {
            forEach($object in $csv)
            {
                if($object.Subject -like "*$Keyword*")
                {
                    Write-Output($object);
                }
            }
        }
    }

    <#
    if($Export -ne $null)
    {
    
    }

    if($DisplayAllCertificates -eq $True)
    {
        # Write-Output($csv);
    }
    #>
}

End
{

}