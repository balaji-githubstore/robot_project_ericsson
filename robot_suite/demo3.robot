*** Settings ***
Library    OperatingSystem
Library    Collections

*** Variables ***
${BROWSER_NAME}        chrome
@{COLORS}    red    green    yellow   orange
&{MY_RECORD}    name=Bala    mobile=78878    role=trainer

*** Test Cases ***
TC5
    Log To Console    ${MY_RECORD}
    Log To Console    ${MY_RECORD}[mobile]
    Log To Console    ${MY_RECORD}[role]


TC6
    Log To Console    ${MY_RECORD}


TC1
    Log To Console    ${BROWSER_NAME} 
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[0]

    @{files}    List Files In Directory    path=D:${/}Mine
    Log To Console    ${files}
    Log To Console    ${files}[0]

TC2
    FOR    ${i}    IN RANGE    0    4    1
        Log To Console    ${i}
    END

TC3
    ${count}    Get Length    ${COLORS}
    Log To Console    ${count}


TC4
    @{folders}  List Directories In Directory    path=D:${/}Mine
    Log To Console    ${folders}

    ${count}    Get Length    ${folders}
    Log To Console    ${count}

    FOR    ${i}    IN RANGE    0    ${count}    1
        Log To Console    ${folders}[${i}]
    END

TC7
    @{fruits}    Create List    banana    orange     apple
    Log To Console    ${fruits}
    Append To List    ${fruits}    grapes
    Log To Console    ${fruits}    
    Remove Values From List    ${fruits}    banana
    Log To Console    ${fruits}

*** Comments ***
    Task 1
    Get all directory and print it 
    iterate and print the directory one by one 