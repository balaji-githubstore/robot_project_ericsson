*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

Suite Setup    Get Auth Token

*** Keywords ***
Get Auth Token 
    Create Session    alias=auth    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=auth    url=pet/601
    # Log    ${response.json()} 
    # Log    ${response.json()}[category]
    # Log    ${response.json()}[category][id]
    ${token}     Set Variable    ${response.json()}[category][id]
    # Set Local Variable    ${token}    ${response.json()}[category][id]
    # [Return]    ${token}
    Set Global Variable    ${TOKEN}    ${token}
    Return From Keyword    ${token}

*** Test Cases ***
TC1 Get Pet 
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/501
    Log To Console    ${response} 
    Status Should Be    200    ${response}
    
TC2 Get Pet 
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/501
    Log    ${response.json()} 
    Log    ${response.json()}[id]
    Log    ${response.json()}[name]
    ${output}    Convert To String    ${response.json()}
    Should Contain    ${output}    category

TC3 Find By Status
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/findByStatus?status=available
    Log    ${response.json()} 

TC4
    ${json}    Get Binary File    path=${EXECDIR}${/}files${/}add_pet.json
    Log To Console    ${json}
    
    &{headers}     Create Dictionary    Content-Type=application/json     Connection=keep-alive  

    Create Session    alias=petshop    url=https://petstore.swagger.io/v2

    ${response}    POST On Session    alias=petshop    url=pet    headers=${headers}    data=${json}
    
    Log    ${response}
    Status Should Be    200    ${response}


TC5
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    DELETE On Session   alias=petshop    url=pet/501
    Status Should Be    200       ${response}


TC6
    ${json}    Get Binary File    path=${EXECDIR}${/}files${/}add_pet_u.json
    Log To Console    ${json}
    
    &{headers}     Create Dictionary    Content-Type=application/json     Connection=keep-alive  

    Create Session    alias=petshop    url=https://petstore.swagger.io/v2

    ${response}    PUT On Session    alias=petshop    url=pet    headers=${headers}    data=${json}
    
    Log    ${response}
    Status Should Be    200    ${response}


TC7
    ${token}    Get Auth Token 
    Log To Console    ${token}

    ${json}    Get Binary File    path=${EXECDIR}${/}files${/}add_pet.json
    &{headers}     Create Dictionary    Content-Type=application/json     Connection=keep-alive    Authorization=${token}  
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    POST On Session    alias=petshop    url=pet    headers=${headers}    data=${json}
    Log    ${response}
    Status Should Be    200    ${response}

TC8
    Log To Console    ${TOKEN}