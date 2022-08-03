*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.db4free.net/ 
    Click Element    partial link=phpMyAdmin
    Switch Window    phpMyAdmin
    Wait Until Element Is Visible    id=input_username    40s
    Input Text    id=input_username    admin
    Input Password    id=input_password    admin123
    Click Element    id=input_go
    Element Should Contain    xpath=//div[@id='pma_errors']/div    Access denied for user

TC2
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.db4free.net/ 
    Click Element    partial link=phpMyAdmin
    Switch Window    NEW
    Wait Until Element Is Visible    id=input_username    40s
    Input Text    id=input_username    admin
    Input Password    id=input_password    admin123
    Click Element    id=input_go
    Element Should Contain    xpath=//div[@id='pma_errors']/div    Access denied for user
    
    # Press Keys    None    CONTROL+TAB
    # Switch Window    MAIN
    # Close Window

#check for new window count 
TC3
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.db4free.net/ 
    Click Element    partial link=phpMyAdmin

    FOR    ${i}    IN RANGE    1    50    1
        @{windows}    Get Window Handles
        Log     ${windows} 
        ${count}    Get Length    ${windows}
        Exit For Loop If    '${count}'=='2'
    END

    Switch Window    NEW
    Input Text    id=input_username    admin
    # Press Keys    None    CTRL+t