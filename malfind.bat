@ECHO OFF
REM Script takes file objects and identifies file magic items and copies to current working directory
REM The script also uploads everything to VirusTotal using the utility

echo *** Instructions: ***
echo * Enter a path where you have the suspect malware related files *
echo * Example: c:\malware\ OR "c:\malware samples\spaces in folder"
echo * If VirusTotal has the known hashes already: You will receive a pop up to close or re-upload
echo * Known bug: cmd.exe expansion for tokens may cause duplicates in VT upload
echo *********************

REM Take user input to path
SET /P i="Enter the folder where the suspect files are:"

echo *** You Entered: ***
echo %i%

REM Check folders recursive
echo *** Writing to magic_results.txt. Please wait. ***
FOR /R %i% %%x IN (*.*) DO (file -m magic "%%x") >> %cd%\magic_results.txt

echo *** File magic parsing complete. ***

REM grep -i -w "executable\|java\|zip" magic_results.txt | gawk -F; "{ print $1 }" | xargs -t -0 -d \n -I % copy % C:\temp\
REM print the results into a lock file since win32 xargs does not support delimiter option
echo *** Looking for only Executables, Java Files, and Zip Archives ***
grep -i -w "executable\|java\|zip" magic_results.txt | gawk -F; "{ print $1 }" >> %cd%\magic_results_dir.txt

REM windows won't make the dir for you automatically when copying
mkdir %cd%\malware

echo *** Copying malware into CURRENT DIRECTORY\malware ***
REM iterate through file for path and then copy to current directory under malware
FOR /F "tokens=*" %%a IN (%cd%\magic_results_dir.txt) DO copy "%%a %cd%\malware"

echo *** Done ***

echo *** Uploading to VirusTotal ***
FOR  /F "tokens=*" %%v IN (%cd%\magic_results_dir.txt) DO (VirusTotalUpload2.exe "%%v")

echo *** Done ***

echo *** Cleaning up lock files ***

del %cd%\magic_results.txt
del %cd%\magic_results_dir.txt

echo *** Done ***

exit /b
