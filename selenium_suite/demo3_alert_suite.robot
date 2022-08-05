*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1
    [Tags]    5    OP-5
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    Click Element    xpath=//img[@alt='Go']
    ${alert_text}      Handle Alert    action=DISMISS    timeout=40s
    Log To Console    ${alert_text} 
    Should Be Equal      ${alert_text}      Customer ID${SPACE}${SPACE}cannot be left blank.
    [Teardown]     Close Browser
    

TC2
    [Tags]    high    OP-11 
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Fail
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    Click Element    xpath=//img[@alt='Go']
    Alert Should Be Present    text=Customer ID${SPACE}${SPACE}cannot be left blank.    action=ACCEPT    timeout=50s 