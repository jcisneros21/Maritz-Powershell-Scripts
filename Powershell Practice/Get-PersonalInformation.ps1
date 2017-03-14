function Get-PersonalInformation {
    [CmdletBinding()]
    
    Param (
        [String]$Name,
        [Int]$Age,
        [String]$Email
    )

    Begin {
        
    }

    Process {
        if($Age -lt 13) {
            Write-Error -Message "The user is below the age of 13. The program will now terminate."
        }
        elseif($Email -notmatch "^\w+@\w+\.\w+") {
            Write-Error -Message "Please enter a real email address";
        }
        else {
            Write-Output "Your name is $Name, you are $Age years old, and your email is $Email.";
        }

        if($Age -gt 65) {
            Write-Output "You are able to retire!";
        }
    }

    End {

    }
}