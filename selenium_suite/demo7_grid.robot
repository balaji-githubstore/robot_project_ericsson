*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=edge    remote_url=http://172.17.67.65:4444
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
     Set Selenium Implicit Wait    30s
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Element    name=Submit
    [Teardown]     Close Browser


TC2
    Open Browser    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    browser=chrome    remote_url=http://172.17.67.65:4444

    Open Browser    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    browser=chrome    remote_url=http://172.17.67.65:4444
    Sleep    10s
    [Teardown]     Close All Browsers


