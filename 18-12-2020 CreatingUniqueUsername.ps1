function CreatingUnqiueUsername {
    param (
        [parameter(Position=1,Mandatory=$True)][string]$string,
        [parameter(Position=2)][Int64]$StartPoint = 0,
        [parameter(Position=3)][Int64]$EndPoint = $string.length,
        
        [parameter(,Position=4)][string]$secondstring,
        [parameter(,Position=5)][Int64]$secondStartPoint = 0,
        [parameter(,Position=6)][Int64]$SecondEndPoint = $secondstring.length
    )

    if(!$secondstring){
        $Username = $string.substring($StartPoint,$EndPoint)
    }else {
        $Username = $string.substring($startpoint,$EndPoint) + $secondstring.Substring($secondStartPoint,$SecondEndPoint)
    }
    
    [int] $inc = 0 
    if (Get-ADuser -Filter {SamAccountName -eq $Username}) {
        do {
            $inc ++
            $Username = $Username + [string]$inc
        }
        until (!(Get-ADuser -Filter {SamAccountName -eq $Username}))   
    }

    Return $Username

}


$test = CreatingUnqiueUsername -string testbob
$test