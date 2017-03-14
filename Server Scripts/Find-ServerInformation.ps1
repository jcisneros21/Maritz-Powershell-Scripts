function Find-ServerInformation {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true, Position=0)]
	    [String[]]$Computer,
        [Parameter(Mandatory=$true, Position=1)]
        [ValidateScript({Test-Path $_ })]
        [String]$Path
    )

    Begin {
	    $ServerInformation = Import-Csv $Path;
    }

    Process {
        forEach($EachComputer in $Computer) {
            $ServerInformation | Where-Object { $_.name -like $EachComputer };
        }
    }
}