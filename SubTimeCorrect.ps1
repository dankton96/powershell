Add-Type -AssemblyName 'System.Windows.Forms'
cls
$openFileDialog = New-Object windows.forms.openfiledialog   
$openFileDialog.initialDirectory = [System.IO.Directory]::GetCurrentDirectory()   
$openFileDialog.title = "Select the subtitle file:"   
$openFileDialog.filter = "All files (*.*)| *.*"   
$openFileDialog.ShowHelp = $True   
$result = $openFileDialog.ShowDialog()
$FilePath=$OpenFileDialog.filename
#echo $FilePath
$lines2calc=Get-Content $FilePath | Select-string -Pattern "\d\d:\d\d:\d\d\,\d\d\d --> \d\d:\d\d:\d\d\,\d\d\d"
#$lines2calc.GetType()
#echo $lines2calc.LineNumber
#ChangeLine=[$lines2calc.LineNumber]
foreach ($l in $lines2calc.LineNumber)
{
#	echo $l.type
	$t1=$lines2calc[$l].substring(0,12)
	$t2=$lines2calc[$l].substring(17)
	echo $t1+'\t'+$t2
}