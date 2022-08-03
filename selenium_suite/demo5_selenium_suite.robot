*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1 Upload File
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


    
