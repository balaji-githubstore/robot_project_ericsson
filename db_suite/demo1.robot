*** Settings ***
Library    DatabaseLibrary

Suite Setup    Connect To Database    dbapiModuleName=pymysql     dbName=dbfree_db    dbUsername=dbfree_db    
    ...    dbPassword=12345678    dbHost=db4free.net    dbPort=3306

Suite Teardown      Disconnect From Database

*** Test Cases ***
TC1
    ${count}     Row Count    select * from Products 
    Log To Console    ${count}  

    Row Count Is Equal To X    select * from Products     127
    Row Count Is Greater Than X    select * from Products    100
    Row Count Is Less Than X    select * from Products    200

    Table Must Exist    Products

TC2
    ${output}     Query     select * from Products where product_id=1
    Log To Console    ${output}
    Log To Console    ${output}[0]
    Log To Console    ${output}[0][1]

TC3
    Execute Sql String    update Products set productname='laptop' where product_id=1
    Row Count Is Equal To X    select * from Products where product_id=1 and productname='laptop'    1
    Check If Exists In Database    select * from Products where product_id=1 and productname='laptop'

TC3
    Execute Sql String    delete from Products where product_id=1
    Check If Not Exists In Database    select * from Products where product_id=1
    Execute Sql String     Insert into Products values (1,'king','iii')
 