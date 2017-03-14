function Get-BackRectangle {
    Param (
        [String]$Word
    )

    Begin {
        $CharArray = $Word.ToCharArray();
    }

    Process {
        for($i=$CharArray.Length-2; $i -ge 0; $i--) {
            Write-Host $CharArray[$i] -NoNewline;
        }

        for($i=1; $i -lt $CharArray.Length; $i++) {
            Write-Output "";
            for($j=0; $j -lt $CharArray.Length-2; $j++) {
                Write-Host " " -NoNewline; 
            }
            Write-Host $CharArray[$i] -NoNewline;
        }            
        Write-Output "";
    }

    End {

    }
}