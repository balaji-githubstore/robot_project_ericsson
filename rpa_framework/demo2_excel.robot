*** Settings ***
Library    RPA.Excel.Files

*** Test Cases ***

TC1
    [Tags]    v1     new    [OP_101]
    Open Workbook    ${EXECDIR}${/}test_data${/}test_data.xlsx
    @{lists}    List Worksheets
    Log To Console    ${lists} 
    ${count}    Get Length    ${lists}
    Log To Console    ${count}

    # FOR    ${i}    IN RANGE    0    ${count}    1
    #  Log To Console    ${lists}[${i}]        
    # END

    FOR    ${sheetname}    IN    @{lists}
        Log    ${sheetname}
    END

   ${sheet}     Read Worksheet    ${lists}[0]
   Log To Console    ${sheet}

   ${value}    Get Cell Value    1    1
   Log To Console    ${value}



TC2
    Open Workbook    ${EXECDIR}${/}test_data${/}test_data.xlsx
    ${sheet}    Read Worksheet   Sheet1

    ${value}    Get Cell Value    1    1
    Log To Console    ${value}