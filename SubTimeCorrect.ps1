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
	$t1s=$FileContent[$l.LineNumber-1].substring(0,12)
	$t2s=$FileContent[$l.LineNumber-1].substring(17)
	$t1=3600*([float]$t1s.substring(0,2))+60*([float]$t1s.substring(3,2))+([float]($t1s.substring(6) -replace ',','.'))
	$t2=3600*([float]$t2s.substring(0,2))+60*([float]$t2s.substring(3,2))+([float]($t2s.substring(6) -replace ',','.'))
	#$t1=[float]$t1s.substring(6)
	#$t2=[float]$t2s.substring(6)
	echo $t1'-------'$t2
}