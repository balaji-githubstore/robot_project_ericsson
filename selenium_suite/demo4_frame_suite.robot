*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/
    Select Frame    xpath=//frame[@name='login_page']
   
    Input Text    name=fldLoginUserId    test123
    Click Element    link=CONTINUE

    Unselect Frame

  

TC2
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/
    Select Frame    name=login_page
   
    Input Text    name=fldLoginUserId    test123
    Click Element    link=CONTINUE

    Unselect Frame


TC3
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/
    Select Frame    css=[name='login_page']
   
    Input Text    name=fldLoginUserId    test123
    Click Element    link=CONTINUE

    Unselect Frame