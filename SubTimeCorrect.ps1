Add-Type -AssemblyName 'System.Windows.Forms'
cls
$openFileDialog = New-Object windows.forms.openfiledialog   
$openFileDialog.initialDirectory = [System.IO.Directory]::GetCurrentDirectory()   
$openFileDialog.title = "Select the subtitle file:"   
$openFileDialog.filter = "All files (*.*)| *.*"   
$openFileDialog.ShowHelp = $True   
$result = $openFileDialog.ShowDialog()
$FilePath=$OpenFileDialog.filename
$FileContent=Get-Content $FilePath
#echo $FileContent
#echo $FilePath
$lines2calc=Get-Content $FilePath | Select-string -Pattern "\d\d:\d\d:\d\d\,\d\d\d --> \d\d:\d\d:\d\d\,\d\d\d"
#echo $lines2calc.GetType()
#echo ($lines2calc.LineNumber)
foreach ($l in $lines2calc)
{
#	echo $FileContent[$l.LineNumber-1]
	$t1=$FileContent[$l.LineNumber-1].substring(0,12)
	$t2=$FileContent[$l.LineNumber-1].substring(17)
	echo ($t1+'\t'+$t2)
}
#foreach ($l in $lines2calc)
#{
#	$s=ToString($lines2calc[$l])
#	$t1=$s.substring(0,12)
#	$t2=$s.substring(17)
#	echo $t1+'\t'+$t2
#}
