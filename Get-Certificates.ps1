function Get-Certificates {
    [CmdletBinding()]
    Param (
	    [String]$Computer,
        [String]$Path
    )

    Begin {
	    $Session = $null;
    }

    Process {
        $Session = New-MitsSession -ComputerName $Computer;
		
	    if($Session -ne $null) {
            Write-Verbose -Message "$Computer";
	        Write-Verbose -Message "Writing to the file";
	        Invoke-Command -Session $Session -ScriptBlock {get-childitem cert:\localmachine\my} | 
		        Select-Object -Property Subject,issuer,notafter,PSComputerName | 
			        Export-CSV $Path -Append;
	        Remove-PSSession -session $Session;
	    }
	    else {
	        "$Computer" | Export-Csv C:\SavedInformation\FailedConnections.csv -Append;
	    }

    }
}
