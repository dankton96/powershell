Add-Type -AssemblyName 'Windows.Forms'
$openFileDialog = New-Object windows.forms.openfiledialog   
$openFileDialog.initialDirectory = [System.IO.Directory]::GetCurrentDirectory()   
$openFileDialog.title = "Select PublishSettings Configuration File to Import"   
$openFileDialog.filter = "All files (*.*)| *.*"   
$openFileDialog.ShowHelp = $True   
$result = $openFileDialog.ShowDialog()   # Display the Dialog / Wait for user response 
    # in ISE you may have to alt-tab or minimize ISE to see dialog box
#$FilePath=$OpenFileDialog.filename
#echo $FilePath
#    $result 
#    if($result -eq "OK")    {    
#            Write-Host "Selected Downloaded Settings File:"  -ForegroundColor Green  
               
            # $OpenFileDialog.CheckFileExists 
             
            # Import-AzurePublishSettingsFile -PublishSettingsFile $openFileDialog.filename  
            # Unremark the above line if you actually want to perform an import of a publish settings file  
#            Write-Host "Import Settings File Imported!" -ForegroundColor Green 
#        } 
#        else { Write-Host "Import Settings File Cancelled!" -ForegroundColor Yellow} 
#    
# video of Script https://channel9.msdn.com/Series/GuruPowerShell 
# More scripts from Dan Stolts "ITProGuru" at http://ITProGuru.com/Scripts