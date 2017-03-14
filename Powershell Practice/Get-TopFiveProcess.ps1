[CmdletBinding()]
Param (
    [String[]]$Computers
)

Begin {
    $Session = $null;
}

Process {
    foreach($EachComputer in $Computers) {
        $Session = New-MitsSession -ComputerName $EachComputer;
        if($Session -ne $null) {
            Write-Verbose("Writing to the file");
            Invoke-Command -Session $Session -ScriptBlock {Get-Process} | 
                Sort-Object -Property CPU -Descending | 
                    Select-Object -Property ProcessName, CPU, @{Name="Computer";Expression={$EachComputer}} -First 5 |
			            Export-CSV C:\SavedInformation\Processes.csv -Append;
		    Remove-PSSession -session $Session;
	     }
    }
}

End {

}