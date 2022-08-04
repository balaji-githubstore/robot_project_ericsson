*** Settings ***
Library    FakerLibrary

*** Test Cases ***
TC1
    ${output}     Word
    Log To Console    ${output}

    ${output}    Credit Card Number
    Log To Console    ${output}