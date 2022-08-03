*** Variables ***
${BROWSER_NAME}        chrome

*** Test Cases ***
TC1
    ${radius}    Set Variable    10
    ${result}    Evaluate    3.14*${radius}*${radius}
    Set Global Variable    ${OUTPUT}    ${result}
    # ${BROWSER_NAME}     Set Variable    ${result}
    Log To Console     ${result} 

TC2
   Log To Console     ${OUTPUT}
