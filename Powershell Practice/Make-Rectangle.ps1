function Make-Rectangle {
    Param (
        [String]$Word,
        [Int]$Width,
        [Int]$Height
    )

    Begin {
        $CharArray = $Word.ToCharArray();
    }

    Process {
        Write-Output $CharArray[0];
        for($i=0; $i -lt $Height; $i++) {
            if(($i % 2) -eq 0) {
                for($j=1;$j -lt $CharArray.Length; $j++) {
                    Write-Output $CharArray[$j];
                }
            else {
                for($j=$CharArray.Length;$j -gt 0; $j--) {
                    Write-Output
    }

    End {

    }
}