function WriteScreen {
    [CmdletBinding()]
    param (
        $sverse
    )
    process {
        Write-Host $top -NoNewline
        write-host $toolbar -NoNewline
        write-host $bottomoftop -NoNewline
        Write-host $body -NoNewline
        write-host $topofbutt -NoNewline
        Write-Host $bottombutt -NoNewline
        bibleout -book $CurrentBook -view $view -verse $sverse -chapter $currentChapter
        $command = read-host
        ReadCommand -command $command
    }
}
function ReadCommand {
    [CmdletBinding()]
    param(
        $command = ""
    )
    process {
        if ($command -eq "x") {
            return
        }
        elseif ($command -eq "s"){
            Clear-Host
            writescreen -sverse $global:lastverse
        }
        elseif ($command -eq "w"){
            clear-host
            $yeah = [math]::ceiling($global:firstverse-8)
            WriteScreen -sverse $yeah
        }
        elseif ($command -eq "d"){
            Clear-Host
            $currentChapter = $currentChapter + 1
            writescreen -sverse 1
        }
        elseif ($command -eq "a"){
            abouts
        }
        elseif ($command -eq "h"){
            helps
        }
        elseif ($command -eq "g"){
            goto
        }
        else {
            clear-host
            WriteScreen -sverse $global:firstverse
        }
    }   
}
function bibleout {
    [CmdletBinding()]
    param(
        $book = "Genesis",
        $chapter = 1,
        $verse = 1,
        $view = ""
    )
    process {
        if ($view -eq "single"){
            ######################################################
            #  Setting the ammount of space I can show bible in  #
            ######################################################
            $biblepanewidth = $($Host.UI.RawUI.WindowSize.Width - 2)
            $biblepaneheight = $($Host.UI.RawUI.WindowSize.Height - 5)
            $bb = Get-Content .\kjv.json | ConvertFrom-Json
            if ($book -eq "Genesis"){$bible = $bb.Genesis}
            elseif ($book -eq "Exodus"){$bible =$bb.Exodus}
            elseif ($book -eq "Leviticus"){$bible =$bb.Leviticus}
            elseif ($book -eq "Numbers"){$bible =$bb.Numbers}
            elseif ($book -eq "Deuteronomy"){$bible =$bb.Deuteronomy}
            elseif ($book -eq "Joshua"){$bible =$bb.Joshua}
            elseif ($book -eq "Judges"){$bible =$bb.Judges}
            elseif ($book -eq "Ruth"){$bible =$bb.Ruth}
            elseif ($book -eq "1 Samuel"){$bible =$bb."1 Samuel"}
            elseif ($book -eq "2 Samuel"){$bible =$bb."2 Samuel"}
            elseif ($book -eq "1 Kings"){$bible =$bb."1 Kings"}
            elseif ($book -eq "2 Kings"){$bible =$bb."2 Kings"}
            elseif ($book -eq "1 Chronicles"){$bible =$bb."1 Chronicles"}
            elseif ($book -eq "2 Chronicles"){$bible =$bb."2 Chronicles"}
            elseif ($book -eq "Ezra"){$bible =$bb.Ezra}
            elseif ($book -eq "Nehemiah"){$bible =$bb.Nehemiah}
            elseif ($book -eq "Esther"){$bible =$bb.Esther}
            elseif ($book -eq "Job"){$bible =$bb.Job}
            elseif ($book -eq "Psalms"){$bible =$bb.Psalms}
            elseif ($book -eq "Proverbs"){$bible =$bb.Proverbs}
            elseif ($book -eq "Ecclesiastes"){$bible =$bb.Ecclesiastes}
            elseif ($book -eq "Song of Solomon"){$bible =$bb."Song of Solomon"}
            elseif ($book -eq "Isaiah"){$bible =$bb.Isaiah}
            elseif ($book -eq "Jeremiah"){$bible =$bb.Jeremiah}
            elseif ($book -eq "Lamentations"){$bible =$bb.Lamentations}
            elseif ($book -eq "Ezekiel"){$bible =$bb.Ezekiel}
            elseif ($book -eq "Daniel"){$bible =$bb.Daniel}
            elseif ($book -eq "Hosea"){$bible =$bb.Hosea}
            elseif ($book -eq "Joel"){$bible =$bb.Joel}
            elseif ($book -eq "Amos"){$bible =$bb.Amos}
            elseif ($book -eq "Obadiah"){$bible =$bb.Obadiah}
            elseif ($book -eq "Jonah"){$bible =$bb.Jonah}
            elseif ($book -eq "Micah"){$bible =$bb.Micah}
            elseif ($book -eq "Nahum"){$bible =$bb.Nahum}
            elseif ($book -eq "Habakkuk"){$bible =$bb.Habakkuk}
            elseif ($book -eq "Zephaniah"){$bible =$bb.Zephaniah}
            elseif ($book -eq "Haggai"){$bible =$bb.Haggai}
            elseif ($book -eq "Zechariah"){$bible =$bb.Zechariah}
            elseif ($book -eq "Malachi"){$bible =$bb.Malachi}
            elseif ($book -eq "Matthew"){$bible =$bb.Matthew}
            elseif ($book -eq "Mark"){$bible =$bb.Mark}
            elseif ($book -eq "Luke"){$bible =$bb.Luke}
            elseif ($book -eq "John"){$bible =$bb.John}
            elseif ($book -eq "Acts"){$bible =$bb.Acts}
            elseif ($book -eq "Romans"){$bible =$bb.Romans}
            elseif ($book -eq "1 Corinthians"){$bible =$bb."1 Corinthians"}
            elseif ($book -eq "2 Corinthians"){$bible =$bb."2 Corinthians"}
            elseif ($book -eq "Galatians"){$bible =$bb.Galatians}
            elseif ($book -eq "Ephesians"){$bible =$bb.Ephesians}
            elseif ($book -eq "Philippians"){$bible =$bb.Philippians}
            elseif ($book -eq "Colossians"){$bible =$bb.Colossians}
            elseif ($book -eq "1 Thessalonians"){$bible =$bb."1 Thessalonians"}
            elseif ($book -eq "2 Thessalonians"){$bible =$bb."2 Thessalonians"}
            elseif ($book -eq "1 Timothy"){$bible =$bb."1 Timothy"}
            elseif ($book -eq "2 Timothy"){$bible =$bb."2 Timothy"}
            elseif ($book -eq "Titus"){$bible =$bb.Titus}
            elseif ($book -eq "Philemon"){$bible =$bb.Philemon}
            elseif ($book -eq "Hebrews"){$bible =$bb.Hebrews}
            elseif ($book -eq "James"){$bible =$bb.James}
            elseif ($book -eq "1 Peter"){$bible =$bb."1 Peter"}
            elseif ($book -eq "2 Peter"){$bible =$bb."2 Peter"}
            elseif ($book -eq "1 John"){$bible =$bb."1 John"}
            elseif ($book -eq "2 John"){$bible =$bb."2 John"}
            elseif ($book -eq "3 John"){$bible =$bb."3 John"}
            elseif ($book -eq "Jude"){$bible =$bb.Jude}
            elseif ($book -eq "Revelation"){$bible =$bb.Revelation}
            $charrecover = 0
            $contcont = 0
            $bobby= 0
            $killme = 0
            if ($verse -lt 1) {$verse = 1}
            $global:firstverse = $verse

            for ($i = 0; $i -lt $biblepaneheight; $i++){
            #for ($i = 0; $i -lt 4; $i++){
                $charleft = $biblepanewidth
                $startwithpart = 0
                [System.Console]::SetCursorPosition(1,$i+3)

                if ($killme -ne 0){
                    write-host $killme
                    $charleft = 0
                    $contcont = 0
                    $startwithpart = 1
                    $charrecover = 0
                    $verse = $verse + 1
                    $bobby = 0
                    $killme = 0
                }
                
                if ($contcont -eq 1){
                    $outs = $($bible[$chapter-1][$verse-1])
                    $outswedo = $outs.Substring($bobby)
                    if ($outswedo.length -lt $charleft){
                        write-host $outswedo
                        $charleft = 0
                        $contcont = 0
                        $startwithpart = 1
                        $charrecover = 0
                        $verse = $verse + 1
                    }
                    else {
                        write-host $outswedo.substring(0,$charleft)
                        $killme = $outswedo.substring($charleft)
                        $charleft = 0
                        $contcont = 0
                        $startwithpart = 1
                        $charrecover = 0
                        $bobby = 0
                    }
                }

                #
                # Finish unfinished verse
                #
                if ($charrecover -ne 0) {
                    if ($contcont -eq 0) {
                        $outs = $($bible[$chapter-1][$verse-1])
                        if ($($outs.Length - $charrecover) -le $charleft)
                        {
                            write-host "$($outs.Substring($charrecover))" -NoNewline 
                            $charleft = $charleft - $charrecover
                            $charrecover = 0
                            $verse = $verse + 1
                        }
                        else {
                            write-host $outs.Substring($charrecover,$charleft) -NoNewline
                            $bobby = $charrecover + $charleft
                            $charleft = 0
                            $contcont =1

                        }
                        $startwithpart = 1
                    }
                }

                #
                # New Verse
                #
                $outs = $($bible[$chapter-1][$verse-1])
            
                if (($outs.length + 3) -le $charleft){
                    write-host " $verse " -ForegroundColor DarkGray -NoNewline
                    write-host "$outs" -NoNewline
                    $charleft = $charleft - ($outs.length + $verse.Length + 2)
                    $verse = $verse + 1
                }
                else {
                    #
                    #  If The verse too long to fit on the line 
                    #
                    if ($startwithpart -ne 0) {
                        $startwithpart = 0
                    }
                    else {
                        write-host " $verse " -ForegroundColor DarkGray -NoNewline
                    }
                    $charleft = $charleft - (($verse.tostring()).Length + 2)
                    if ($charleft -lt 0) {
                        $charleft = 0
                    }
                    else{
                        write-host $outs.Substring(0,$charleft) -NoNewline
                    }
                    $charrecover = $charleft
                }   

                $outs = $($bible[$chapter-1][$verse-1])
                if (($outs.length + 3) -le $charleft){
                    write-host " $verse " -ForegroundColor DarkGray -NoNewline
                    write-host "$outs" -NoNewline
                    $charleft = $charleft - ($outs.length + ($verse.tostring()).Length + 2)
                    $verse = $verse + 1
                }
                else {}
                
            }

            $global:lastverse = $verse - 3

            ###########################################
            #  Reset Cursor back to the command line  #
            ###########################################
            [System.Console]::SetCursorPosition(12,$(($Host.UI.RawUI.WindowSize.Height) - 1))
        }
    }
}

function abouts {
    [CmdletBinding()]
    param ()
    process {
        Write-Host $top -NoNewline
        write-host $toolbar -NoNewline
        write-host $bottomoftop -NoNewline
        Write-host $body -NoNewline
        write-host $topofbutt -NoNewline
        Write-Host $bottombutt -NoNewline
        bibleout -book $CurrentBook -view $view -verse $global:firstverse -chapter $currentChapter
        $aboutw = [math]::ceiling(($Host.UI.RawUI.WindowSize.width)/2)-12
        $abouth = [math]::ceiling(($Host.UI.RawUI.WindowSize.Height)/2)-5
        [System.Console]::SetCursorPosition($aboutw,$abouth)
        write-host "╭──────────────────────╮" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+1)
        write-host "│    __                │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+2)
        write-host "│   |  \   |   |       │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+3)
        write-host "│   |__/ o |_  |  _    │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+4)
        write-host "│   |  \ | | \ | /_)   │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+5)
        write-host "│   |__/ | |_/ | \_,   │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+6)
        write-host "│                      │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+7)
        write-host "│"-NoNewline
        write-host " App by Jacob Petrie " -ForegroundColor DarkGray -NoNewline
        write-host " │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+8)
        write-host "╰──────────────────────╯" -NoNewline
        [System.Console]::SetCursorPosition(12,$(($Host.UI.RawUI.WindowSize.Height)-1))
        $command = read-host
        ReadCommand -command $command
    }
}

#####################################################
#  Just a simple popup for showing some short cuts  #
#####################################################
function helps {
    [CmdletBinding()]
    param ()
    process {
        Write-Host $top -NoNewline
        write-host $toolbar -NoNewline
        write-host $bottomoftop -NoNewline
        Write-host $body -NoNewline
        write-host $topofbutt -NoNewline
        Write-Host $bottombutt -NoNewline
        bibleout -book $CurrentBook -view $view -verse $global:firstverse -chapter $currentChapter
        $aboutw = [math]::ceiling(($Host.UI.RawUI.WindowSize.width)/2)-19
        $abouth = [math]::ceiling(($Host.UI.RawUI.WindowSize.Height)/2)-5
        [System.Console]::SetCursorPosition($aboutw,$abouth)
        write-host "╭────────────────────────────────╮" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+1)
        write-host "│ To navigate the current book   │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+2)
        write-host "│ use the single commands listed │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+3)
        write-host "│ here:                          │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+4)
        write-host "│ " -NoNewline
        write-host "      W " -ForegroundColor Cyan -NoNewline
        write-host "    to scroll up       │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+5)
        write-host "│ " -NoNewline
        write-host "      S " -ForegroundColor Cyan -NoNewline
        write-host "    to scroll down     │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+6)
        write-host "│                                │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+7)
        write-host "│ " -NoNewline
        write-host "      G " -ForegroundColor Cyan -NoNewline
        write-host "    go to a new book   │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+8)
        write-host "│ " -NoNewline
        write-host "      X " -ForegroundColor Cyan -NoNewline
        write-host "    closes the app     │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+9)
        write-host "╰────────────────────────────────╯" -NoNewline
        [System.Console]::SetCursorPosition(12,$(($Host.UI.RawUI.WindowSize.Height)-1))
        $command = read-host
        ReadCommand -command $command
    }
}

function goto {
    [CmdletBinding()]
    param ()
    process {
        Write-Host $top -NoNewline
        write-host $toolbar -NoNewline
        write-host $bottomoftop -NoNewline
        Write-host $body -NoNewline
        write-host $topofbutt -NoNewline
        Write-Host "╰───Go─To─>" -NoNewline
        bibleout -book $CurrentBook -view $view -verse $global:firstverse -chapter $currentChapter
        $aboutw = [math]::ceiling(($Host.UI.RawUI.WindowSize.width)/2)-23
        $abouth = [math]::ceiling(($Host.UI.RawUI.WindowSize.Height)/2)-13
        [System.Console]::SetCursorPosition($aboutw,$abouth)
        write-host "╭────────────────────────────────────────────╮" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+1)
        write-host "│            " -NoNewline
        write-host "The Old Testament" -ForegroundColor DarkGray -NoNewline
        write-host "               │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+2)
        write-host "│ Genesis        2 Chronicles     Daniel     │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+3)
        write-host "│ Exodus         Ezra             Hosea      │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+4)
        write-host "│ Leviticus      Nehemiah         Joel       │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+5)
        write-host "│ Numbers        Esther           Amos       │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+6)
        write-host "│ Deuteronomy    Job              Obadiah    │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+7)
        write-host "│ Joshua         Psalms           Jonah      │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+8)
        write-host "│ Judges         Proverbs         Micah      │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+9)
        write-host "│ Ruth           Ecclesiastes     Nahum      │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+10)
        write-host "│ 1 Samuel       Song of Solomon  Habakkuk   │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+11)
        write-host "│ 2 Samuel       Isaiah           Zephaniah  │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+12)
        write-host "│ 1 Kings        Jeremiah         Haggai     │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+13)
        write-host "│ 2 Kings        Lamentations     Zechariah  │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+14)
        write-host "│ 1 Chronicles   Ezekiel          Malachi    │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+15)
        write-host "│  " -NoNewline
        write-host "          The New Testament " -ForegroundColor DarkGray -NoNewline       
        write-host "              │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+16)
        write-host "│ Matthew        Ephesians        Hebrews    │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+17)
        write-host "│ Mark           Philippians      James      │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+18)
        write-host "│ Luke           Colossians       1 Peter    │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+19)
        write-host "│ John           1 Thessalonians  2 Peter    │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+20)
        write-host "│ Acts           2 Thessalonians  1 John     │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+21)
        write-host "│ Romans         1 Timothy        2 John     │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+22)
        write-host "│ 1 Corinthians  2 Timothy        3 John     │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+23)
        write-host "│ 2 Corinthians  Titus            Jude       │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+24)
        write-host "│ Galatians      Philemon         Revelation │" -NoNewline
        [System.Console]::SetCursorPosition($aboutw,$abouth+25)
        write-host "╰────────────────────────────────────────────╯" -NoNewline
        [System.Console]::SetCursorPosition(12,$(($Host.UI.RawUI.WindowSize.Height)-1))
        $command = read-host
        ReadCommand -command $command
    }
}

#####################
#  Creating the UI  #
#####################
$top = "╭" + "─"*$(($Host.UI.RawUI.WindowSize.Width)-2) + "╮"
$toolbar = "│ Bible.exe   (V)iew  (H)elp  (A)bout"+ " "*$(($Host.UI.RawUI.WindowSize.Width)-42) +"(X) │"
$bottomoftop = "├" + "─"*$(($Host.UI.RawUI.WindowSize.Width)-2) + "┤"
$body = $("│" + " "*$(($Host.UI.RawUI.WindowSize.Width)-2) + "│")*(($Host.UI.RawUI.WindowSize.Height)-5)
$topofbutt = "├" + "─"*$(($Host.UI.RawUI.WindowSize.Width)-2) + "╯"
$bottombutt = "╰─Command─>" 

##########################
#  Opening the Settings  #
##########################
$settings = Get-Content .\settings.json | ConvertFrom-Json
$CurrentBook = $settings.LastBook
$currentChapter = $settings.LastChapter -as[int]
if ($currentChapter -lt 1){$currentChapter = 1}
$view = $settings.view
$global:lastverse = 1
$global:firstverse = 1

WriteScreen


#   BUG LIST
# ------------------------------------------------------
#   - Goes way past verses at the end
#   - 
#  
#   FEATURES TO ADD
# ------------------------------------------------------
#   - Keep words together when wrapping around
#   - 
#