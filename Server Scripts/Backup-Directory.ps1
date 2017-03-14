 function Backup-Directory {

    Param
    (
        [String]$Directory
    )

    Begin
    {

    }

    Process
    {
        Copy-Item $Directory C:\Backups -Recurse -Force;
    }

    End
    {

    }
}