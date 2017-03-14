[CmdletBinding()]
Param (
    [String[]]$Computers
)

Begin {
    $Session = $null;
}

Process {
    Write-Output "Hello 1";
    foreach($EachComputer in $Computers) {
        Write-Output "Hello 2";
        $Session = New-MitsSession -ComputerName $EachComputer;
        if($Session -ne $null) {
            Write-Verbose("Writing to the file");
		    Invoke-Command -Session $Session -ScriptBlock {Get-Website} | 
		        Select-Object -Property Name,Id,State,Bindings,@{Name="Computer";Expression={$EachComputer}} |
			        Export-CSV C:\Test_Scripts\Websites.csv -Append;
		    Remove-PSSession -session $Session;
	     }
    }
    Write-Output "Hello 3";
}

End {

}