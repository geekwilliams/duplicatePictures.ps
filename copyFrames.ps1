## Script to duplicate pictures into directory, mainly for use in creating video from still images
## Created 2-14-2020 by Caleb Williams

$frames = Get-ChildItem ''                               # Literal path to picures you want to duplicate. Directory can contain multiple files
$p = ''                                                  # Literal path to directory to put duplicates into
 

$index = 0                                               # Starting index for While loop

$totalFrames = 7200                                      # Total number of final duplicates
$totalIndex = 3600                                       # This number should be $totalFrames value divided by total number of pictures in $frames directory  

$frameIndex = 0                                          # This is used to account for case where more than one file is located in $frames

function copyFiles(){

    While ($index -lt $totalIndex){

        $progressPercent = ( $index / $totalIndex)*(100)
        $percent = $progressPercent | % { '{0:0.##}' -f $_ }
    
        Write-Progress -Activity "Copying files..." -Status "$percent% Percentage Complete." -PercentComplete $percent 
        
        foreach($frame in $frames) {
            
           Write-Progress -Id 1 -Activity "Processing frames:" -Status "frame: $frameIndex" 
        
           Copy-Item -Path $frame.FullName -Destination ($p + ('frame_' + $frameIndex.ToString()) + '.tif')
           
           $frameIndex += 1
        
        }
           
        $index += 1
    }

}

copyFiles