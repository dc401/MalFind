MalFind
=======

Batch Script that takes file objects and identifies file magic items and copies to current working directory. The script also uploads everything to VirusTotal.

This script is licensed under GPL v3 for anyone to use without warranty.

Author: Dennis Chow 
dchow [AT] xtecsystems.com
Date: 20131024

*** Instructions: ***
* Enter a path where you have the suspect malware related files *
* Example: c:\malware\ OR "c:\malware samples\spaces in folder"
* If VirusTotal has the known hashes already: You will receive a pop up to close or re-upload
* Known bug: cmd.exe expansion for tokens may cause duplicates in VT upload
*********************

To run: run malfind.bat from the same location as the support files.

Dependent files that either need to be registered in the variables path
or in the same working folder. You can easily eliminate this by downloading the GNU Win32 tools packages from Sourceforge.

Dependencies:
    updatedb
    malfind.bat
    magic
    magic.mgc
    file.exe
    magic1.dll
    libmagic.la
    VirusTotalUpload2.exe
    egrep.exe
    fgrep.exe
    grep.exe
    libiconv2.dll
    pgawk.exe
    pgawk-3.1.6.exe
    awk.exe
    gawk.exe
    gawk-3.1.6.exe
    igawk
    regex2.dll
    zlib1.dll
    pcre3.dll
    libintl3.dll
    locate.exe
    find.exe
    xargs.exe
    README.txt
