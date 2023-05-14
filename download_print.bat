@echo off
setlocal enabledelayedexpansion

REM Set the directory path to save the downloaded files
set "saveDir=%~dp0\Downloads"

REM Create the save directory if it doesn't exist
if not exist "%saveDir%" mkdir "%saveDir%"

REM Set the counter variable
set counter=1

REM Read URLs from the url.txt file and download each file
for /f "usebackq delims=" %%a in ("url.txt") do (
  REM Remove any special characters or spaces from the URL, if needed

  REM Extract the filename from the URL
  for /f "delims=?alt" %%b in ("%%a") do (
    set "filename=%%~nxb"
    REM Remove the .pdf extension from the filename
    set "filename=!filename:.pdf=!"

    REM Append the counter to the filename
    set "newFilename=!filename!_!counter!"

    REM Download the file using curl with the -L option
    curl -L -o "%saveDir%\!newFilename!.pdf" "%%a"

    REM Increment the counter
    set /a counter+=1

    REM Display a message indicating the file that would be printed
    echo Simulating printing: "%saveDir%\!newFilename!.pdf"
    REM Add any other action or command you want to simulate the printing process
    REM For example, you can display a message box or perform any other desired action

    REM Simulate file as printed (modify as per your requirement)
    echo File printed: "%saveDir%\!newFilename!.pdf"
  )
)


REM Delete the url.txt file
del "url.txt"

REM Delete the save directory (folder)
rd /s /q "%saveDir%"