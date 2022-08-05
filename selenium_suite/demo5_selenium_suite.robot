*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Test Cases ***
TC1 Upload File
    high    smoke   smoke
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    locator=xpath=//input[@type='file']    file_path=D:${/}Mine${/}Balaji-Profile.pdf

TC2 Mouse Activity 
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://nasscom.in/
    Mouse Over    xpath=//a[text()='Membership']
    Click Element    xpath=//a[text()='Members Listing']

TC3 Mouse Activity 
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://nasscom.in/
    Mouse Over    xpath=//a[text()='Membership']
    Mouse Over    xpath=//a[text()='Become a member']
    Click Element    xpath=//a[text()='Membership Benefits']
    # Click Element    partial link=CLICK TO APPLY
    Click Element    xpath=//a[contains(text(),'Click to Apply Online')]
    Click Element    id=edit-field-business-focus-und-112


TC4 CSS Selector 
    [Tags]    high    smoke
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.openemr.io/b/openemr
    Input Text    css=#authUser    admin
    Input Password    css=#clearPass    pass
    Select From List By Label    css=select[name='languageChoice']    English (Indian)
    Click Element    css=#login-button

TC5 malaysiaairlines 
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe        
    ...    options=add_argument("--disable-notifications")
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.malaysiaairlines.com/in/en.html

    Input Text    xpath=//input[@aria-label='fromLocation selectize input']    chennai
    Press Keys    None    ARROW_DOWN	
    Press Keys    None    ENTER

    Input Text    xpath=//input[@aria-label='toLocation selectize input']    pkx
    Press Keys    None    ARROW_DOWN	
    Press Keys    None    ENTER

    # Input Text    name=start    3 Aug 2022
    Execute Javascript    document.querySelector("input[name='start']").value='13 Aug 2022'
    Execute Javascript    document.querySelector("input[name='end']").value='19 Aug 2022'

TC5 PhP Travel 
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://phptravels.net/

    Click Element    xpath=//span[contains(text(),'Search by City')]
    Input Text    xpath=//input[@aria-controls='select2-hotels_city-results']   chennai
    Click Element    xpath=//li[text()='Chennai,India']
    
    # Input Text    id=checkin    
    Execute Javascript    document.querySelector("#checkin").value='13-08-2022'
    Execute Javascript    document.querySelector("#checkout").value='19-08-2022'

    #room = 5 
    #child = 2 
    #nationality = india 
    #click search 

TC6 PhP Travel 
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://phptravels.net/

    Click Element    xpath=//span[contains(text(),'Search by City')]
    Input Text    xpath=//input[@aria-controls='select2-hotels_city-results']   chennai
    Click Element    xpath=//li[text()='Chennai,India']
    
    ${ele}     Get WebElement    xpath=//input[@id='checkin']     
    Execute Javascript    arguments[0].value='13-08-2022'    ARGUMENTS    ${ele}    


TC7 Royal
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Set Selenium Speed    1s
    Go To    url=https://www.royalcaribbean.com/
    Run Keyword And Ignore Error    Click Element    xpath=//*[name()='svg' and @class='email-capture__close']
    
    Click Element    id=rciHeaderSignIn      
    Click Element    link=Create an account
    Input Text    xpath=//input[@data-placeholder="First name/Given name"]    Balaji
    Click Element    xpath=//span[text()='Month']
    Scroll Element Into View    xpath=//span[contains(text(),'Dece')]
    Click Element    xpath=//span[contains(text(),'Dece')]

TC8 Download
    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Set Selenium Speed    1s
    Go To    url=https://www.selenium.dev/downloads/
    Click Element    link=32 bit Windows IE
    ${username}    Get Environment Variable    USERNAME
    Log To Console    ${username} 
    File Should Exist    path=C:${/}Users${/}${username}${/}Downloads${/}IEDriverServer_Win32_4.3.0.zip

TC9 Download
    &{pref}    Create Dictionary    download.default_directory=${EXECDIR}${/}files

    Open Browser    browser=chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe        
    ...    options=add_experimental_option("prefs",${pref})
     Set Selenium Implicit Wait    30s
    Set Selenium Speed    1s
    Go To    url=https://www.selenium.dev/downloads/
    Click Element    link=32 bit Windows IE
    File Should Exist    path=${EXECDIR}${/}files${/}IEDriverServer_Win32_4.3.0.zip
    

TC10 
    Open Browser    browser=chrome    alias=b1    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe 
    Go To    url=https://www.google.co.in/

    Open Browser    browser=chrome    alias=b2    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe 
    Go To    url=https://www.facebook.com/

    # Close Browser
    Switch Browser    b1
    Click Element    tag=a

    Close All Browsers



TC11
    Open Browser    browser=chrome    alias=b1    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe 
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Table Should Contain    xpath=//table[@id='example']    Brenden Wagner
    Table Row Should Contain    xpath=//table[@id='example']    1    Position

TC12
    Open Browser    browser=chrome    alias=b1    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe 
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr

    FOR    ${i}    IN RANGE    1    ${rowcount}+1    1
        ${name1}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name1}    
    END

TC12
    Open Browser    browser=chrome    alias=b1    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe 
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr

    FOR    ${i}    IN RANGE    1    ${rowcount}+1    1
        ${name1}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name1}    
    END 