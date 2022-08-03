*** Settings ***
Library    SeleniumLibrary 

*** Test Cases ***
TC1
    Open Browser    url=https://opensource-demo.orangehrmlive.com/    browser=chrome    
    ...    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Element    name=Submit
    Page Should Contain    My Info
    Click Element    id=welcome
    Click Element    link=Logout

TC2
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.facebook.com/  
    Click Element    link=Create New Account
    Input Text    name=firstname    Jack  
    Input Text    name=lastname    wick
    Input Password    id=password_step_input    welcom@123
    Click Element    xpath=//input[@value='-1']
    Select From List By Label    id=day    20
    Select From List By Value    xpath=//select[@title='Month']      12
    Select From List By Label    id=year    2000
    Click Element    name=websubmit
    Click Element    xpath=//div[text()='Sign Up']/../../img

TC3
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://goto.com/meeting/
    Run Keyword And Ignore Error    Click Element    id=truste-consent-button
    
    Click Element    partial link=Try Free

TC4
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://goto.com/meeting/
    @{results}    Run Keyword And Ignore Error    Click Element    id=truste-consent-button
    Log To Console    ${results} 
    Log      ${results} 
    Click Element    partial link=Try Free

*** Comments ***
1. Navigate to https://www.facebook.com/
2. Click On Create New Account
3. Enter First Name as jack 
4. Enter Surname as wick
5. enter password as welcome@123
6. Gender - Custom
7. DOB - 20 Dec 2000 
8. click on signup

    # Click Element    data:testid:open-registration-form-button




    