echo Author: Peyton Chandarana
echo Date Last Modified: 06 June 2017
echo Copyright 2017

mkdir C:\Windows\Temp\ProfileScript
cd C:\Windows\Temp\ProfileScript

net user username /del
echo Profile Deleted....
rmdir C:\Users\username /s /q
echo Profile Data Deleted....

echo Entering Registry Deletion....
reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\ProfileList" /f C:\Users\username /s | find "HKEY_LOCAL_MACHINE">temp.txt
set /p GuestKeyPath=<"temp.txt"
>temp.txt echo "%GuestKeyPath:HKEY_LOCAL_MACHINE=HKLM%"
set /p GuestKeyPath=<"temp.txt"
reg delete %GuestKeyPath% /f
echo Profile Key Removed....

echo Creating New Profile Object....
net user username password /add
echo New Profile Object Created....

echo Cleaning Up....
cd C:\
del C:\Windows\Temp\ProfileScript\temp.txt
rmdir C:\Windows\Temp\ProfileScript /s /q

echo --------------------------
echo Profile Reset Successfully





