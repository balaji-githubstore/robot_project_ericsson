*** Settings ***
Library    RequestsLibrary
Test Template     Get Pet By Id Template

*** Test Cases ***
TC1   501    200
TC2    101    404

*** Keywords ***
Get Pet By Id Template 
    [Arguments]  ${pet_id}    ${expected_status}
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/${pet_id}
    Log To Console    ${response} 
    Status Should Be    ${expected_status}    ${response}
    
