*** Settings ***
Library             SSHLibrary
# Library        Fla
# Suite Setup         Connect Jidi
# Suite Teardown      Close Connection


*** Keywords ***
Connect Jidi
    [Arguments]    ${alias}
    Open Connection    host=192.168.1.7    port=22    alias=${alias}
    Login    username=jidi    password=123456


*** Test Cases ***
TC1
    File Should Exist    path=C:${/}Mine${/}temp${/}hello.txt

TC2
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    Enable Ssh Logging    ${EXECDIR}${/}files${/}myserver.log
    @{directories}    List Directories In Directory    path=C:${/}
    Log To Console    ${directories}
    

TC3
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    Get File    source=C:${/}Mine${/}temp${/}hello.txt    destination=D:${/}Mine${/}temp${/}hello.txt
    # Put File    source
    # Get Directory    source
# Put Directory

TC4
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${output}    Execute Command    git --version
    Log To Console    ${output}

TC5
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${output}    Execute Command    python --version
    Log To Console    ${output}

TC6 
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${output}    Execute Command    appium -p 7575
    Log To Console    ${output}


TC7
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    Start Command    appium -p 7575
    
TC8
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    Start Command    python --version
    ${output}    Read Command Output
    Log To Console    ${output}

 TC9
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    # # Execute Command    python
    # Write    python 
    # ${stdout}=	Read Until	python
    # Log To Console    ${stdout}
    Start Command    appium
    Sleep    3s
    ${stdout}    Execute Command    print('jie')
    Log To Console    ${stdout} 


TC8
    Open Connection    host=192.168.1.7    alias=jidi    port=22
    Login    username=jidi    password=123456

    Open Connection    host=192.168.1.7    alias=gen    port=22
    Login    username=jidi    password=123456

    Switch Connection    jidi
    #control of jidi machine

    Switch Connection    gen
     #control of gen machine

    Connect Jidi    m1


    Switch Connection    gen
     #control of gen machine


    Switch Connection    m1

    # Get Connections
    Close All Connections
TC9
    Open Connection    host=192.168.1.7    alias=jidi    port=22
    Login    username=jidi    password=123456
    Start Command    java -jar
    Start Command    robot /opt/login.robot 


TC10 
    Click  identifier=//MenuItem[@Name='File']