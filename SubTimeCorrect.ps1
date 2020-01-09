Add-Type -AssemblyName 'System.Windows.Forms'
$openFileDialog = New-Object windows.forms.openfiledialog   
$openFileDialog.initialDirectory = [System.IO.Directory]::GetCurrentDirectory()   
$openFileDialog.title = "Select the subtitle file:"   
$openFileDialog.filter = "All files (*.*)| *.*"   
$openFileDialog.ShowHelp = $True   
$result = $openFileDialog.ShowDialog()   # Display the Dialog / Wait for user response 
    # in ISE you may have to alt-tab or minimize ISE to see dialog box
$FilePath=$OpenFileDialog.filename
#echo $FilePath
$sub=Get-Content $FilePath