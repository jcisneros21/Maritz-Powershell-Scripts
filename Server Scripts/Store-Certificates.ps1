    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateScript({Test-Path $_ })]
        [String]$ServerFile,
        [Parameter(Mandatory=$true, Position=1)]
        [ValidateScript({Test-Path $_ })]
        [String]$CertificateDestination
    )

    Begin {
        $FullFilePath = $null;
        $Condition = $False;

        # If the destination already exists, then either overwrite file or provide another path
        $FullFilePath = $CertificateDestination + "\Certificates.csv";
        while((Test-Path $FullFilePath) -eq $True -and $Condition -eq $False) {
            $Answer = Read-Host -Prompt ("A file in the provided destination already exist with the name Certificates.csv.`n" +
                                         "Would you like to overwrite the file? (Y/N)");
            if($Answer -eq "Y") {
                $Condition = $True;
            }
            elseif($Answer -eq "N") {
                $CertificateDestination = Read-Host -Prompt "Please provide another path";
                $FullFilePath = $CertificateDestination + "\Certificates.csv";
            }
            else {
                Write-Output "Please enter a Y or N.";
                exit;
            }
        }

        # Create or Overwrite a Certificate file for input
        New-Item -Path $CertificateDestination -ItemType file -Name Certificates.csv -Force | Out-Null;
    }

    Process {
    . C:\Test_Scripts\Certificates\Get-Certificates.ps1
    
    #Retrieve the certificates from each server at a time
    $Computers = Get-Content $ServerFile;
        foreach($EachComputer in $Computers) {
            Get-Certificates -Computer $EachComputer -Path $FullFilePath;
        }   
    }

    End {
    
    }