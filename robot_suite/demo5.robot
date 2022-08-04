*** Settings ***
Library    Process
Library    AutoItLibrary

*** Test Cases ***
TC1
  ${process}    Start Process    C:\\WINDOWS\\system32\\notepad.exe
  ${result} =	Wait For Process	${process}    timeout=50 minutes
  Log To Console    ${result}
  Terminate Process
  
TC2
  ${process}    Run Process    java     -version
  Log To Console    ${process.rc}

  