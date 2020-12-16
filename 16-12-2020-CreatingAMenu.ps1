Function Create-Menu{

    Param(
        [parameter(Mandatory=$True)][string]$MenuTitle,
        [parameter(Mandatory=$True)][array]$MenuOptions
    )

    $MaxValue = $Menuoptions.Count-1
    $selection = 0
    $EnterPressed = $false

    Clear-Host

    while($EnterPressed -eq $false){

        write-host "$MenuTitle"

        For ($i=0; $i -le $MaxValue; $i++){

            If ($i -eq $Selection){
                Write-Host -BackgroundColor Red -ForegroundColor White "[ $($MenuOptions[$i]) ]"
            } Else {
                Write-Host "  $($MenuOptions[$i])  "
            }
        }

        $KeyInput = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown").virtualkeycode

        Switch($KeyInput){
            13{
                $EnterPressed = $True
                Return $($Menuoptions[$selection])
                Clear-Host
                break
            }

            38{
                If ($Selection -eq 0){
                    $Selection = $MaxValue
                } Else {
                    $Selection -= 1
                }
                Clear-Host
                break
            }

            40{
                If ($Selection -eq $MaxValue){
                    $Selection = 0
                } Else {
                    $Selection +=1
                }
                Clear-Host
                break
            }
            Default{
                Clear-Host
            }
        }
    }    
}


$title = "What do you want your computer to do"

$options = @('Nothing','Restart','Shutdown','Download a Virus')

$Choise = Create-Menu $title $options

Write-output "Your computer will: $Choise"