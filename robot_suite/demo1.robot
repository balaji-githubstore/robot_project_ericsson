*** Settings ***
Library    DateTime
Library    OperatingSystem
Library    String

*** Variables ***
${MY_NAME}    Bala
${LOCATION}    India 

*** Test Cases ***
TC1
    Log To Console    message=Balaji Dinakaran    
    Log To Console    Hello
    Log    message=jack
    Log To Console    ${LOCATION}

TC2
    Log To Console    check
    Log To Console    ${LOCATION}

TC3 
   ${mobile_number}    Set Variable    989888
   Log To Console    ${mobile_number}

TC4
    ${radius}    Set Variable    10
    ${result}    Evaluate    3.14*${radius}*${radius}
    ${expected_result}        Convert To Integer    314
    Log To Console    ${result}
    Should Be Equal    ${result}    ${expected_result} 

TC5
    ${date}    Get Current Date
    Log To Console    ${date}

TC6
    Create Directory    path=D:${/}Mine${/}Hello  
    Directory Should Exist    path=D:${/}Mine${/}Hello 

TC7
    Create Directory    path=${EXECDIR}${/}driver

TC8
    Create File    path=${EXECDIR}${/}driver${/}demo.txt    content=hello123
    Remove File    path=${EXECDIR}${/}driver${/}demo.txt

TC9 
    Log To Console    ${EXECDIR}${/}driver${/}demo.txt
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${TEST_NAME}
    Log To Console    ${SUITE_NAME}

TC10 
    ${sal}    Set Variable    $120,000,000
    ${sal}    Remove String    ${sal}    $    ,
    ${sal}    Evaluate    ${sal}+${sal}
    Log To Console    ${sal}