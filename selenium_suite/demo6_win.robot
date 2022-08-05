*** Settings ***
Library    SeleniumLibrary
Library    AutoItLibrary

*** Comments ***
http://Username:Password@SiteURL


*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://Username:Password@softwaretesting.com/

TC2
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://softwaretesting.com/
    Sleep    2s
    Send    hello
    Send    {TAB}
    Send    hello123
    Send    {ENTER}

TC3
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Click Element    id=pickfiles
    Sleep    1s
    Control Focus    Open    ${EMPTY}    Edit1
    Control Set Text    Open    ${EMPTY}    Edit1    D:${/}Mine${/}Balaji-Profile.pdf
    Control Click    Open    ${EMPTY}    Button1