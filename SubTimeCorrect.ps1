Add-Type -AssemblyName 'System.Windows.Forms','System.DateTime'
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
	$t1s="10/01/1000 "+$FileContent[$l.LineNumber-1].substring(0,12)
	$t2s="10/01/1000 "+$FileContent[$l.LineNumber-1].substring(17)
	#10/01/1000 00:40:13,372
	#$t1=Get-Date -Date(([Int32]$t1s.substring(6,4)),([Int32]$t1s.substring(3,2)),([Int32]$t1s.substring(0,2)),([Int32]$t1s.substring(11,2)),([Int32]$t1s.substring(14,2)),([Int32]$t1s.substring(17,2)),([Int32]$t1s.substring(20,3)))
	#$t2=Get-Date -Date(([Int32]$t2s.substring(6,4)),([Int32]$t2s.substring(3,2)),([Int32]$t2s.substring(0,2)),([Int32]$t2s.substring(11,2)),([Int32]$t2s.substring(14,2)),([Int32]$t2s.substring(17,2)),([Int32]$t2s.substring(20,3)))
	$t1=Get-Date -Date $t1s.substring(0,18)
	$t2=Get-Date -Date $t2s.substring(0,18)
	echo $t1'------'$t2
}