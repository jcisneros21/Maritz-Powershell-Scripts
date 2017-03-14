function Simplify-Fractions {
    [CmdletBinding()]
    
    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [Int64]$Numerator,
        [Parameter(Mandatory=$true, Position=1)]
        [Int64]$Denominator
    )

    Process {
        # Initializing Variables
        $NumeratorDivision = 0;
        $DenominatorDivision = 0;
        $CommonDivider = 0;
        $i = 1;

        # Loop until either parameter is less than 1
        while(($Numerator/$i -ge 1) -and ($Denominator/$i -ge 1)) {
            $NumeratorDivision = $Numerator/$i;
            $DenominatorDivision = $Denominator/$i;

            # If both results are Integers rather than Doubles than save the iterator
            if($NumeratorDivision -is [Int64] -and $DenominatorDivision -is [Int64]) {
                $CommonDivider = $i;
            }
            $i++;
        }

        # Retrieve the simplified fractions
        $NumeratorDivision = $Numerator/$CommonDivider;
        $DenominatorDivision = $Denominator/$CommonDivider;

        Write-Host $NumeratorDivision -NoNewline;
        Write-Host " " -NoNewline;
        Write-Host $DenominatorDivision;

    }
}