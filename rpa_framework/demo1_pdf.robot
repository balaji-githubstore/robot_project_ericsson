*** Settings ***
Library    RPA.PDF

*** Test Cases ***
TC1
    ${page_count}    Get Number Of Pages    D:${/}Mine${/}Balaji-Profile.pdf
    Log To Console    ${page_count}
    &{text}     Get Text From Pdf    D:${/}Mine${/}Balaji-Profile.pdf
    ${page}    Convert To Integer    10
    Log    ${text}[${page}]