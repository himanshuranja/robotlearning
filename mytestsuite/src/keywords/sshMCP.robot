*** Settings ***
Library         OperatingSystem
Resource        anotherkeyword.robot
Library         libraries/myanotherutil.py
Library         SSHLibrary
Library         Collections



*** Variables ***
@{mylist}   100  200  300

@{MCP_USER_PASS}  developer  developer1234

${MCP_IP}   10.11.12.21

&{USER_PASS}     username=developer  password=developer1234

${XX}   himanshu

${XY}   10

*** Keywords ***

Connect to MCP
    [Documentation]  this is just a docmentaion example
    [Tags]  abc  def
    log  connecting to MCP
    ${x}=  set variable  10
    should be equal as integers  ${x}  10




#Connect to MCP
#    Log  "Connecting to MCP"
#    ${result}=  Set Variable  "Connected to MCP"
#    Connect to OLT
#    Log  ${CURDIR}
#    ${age}=  get age
#    Log  ${age}
#    ${l1}=  create list  10  20
#    ${x}=  get from list  ${l1}  0
#    ${x}=  get from list  ${l}  0
#    [Return]  ${result}


#Connect to MCP
#    Log  "Connecting to MCP"
#
#    ${user_pass}=  create list  developer  developer1234
#    ${server_index_to_mcp}=  open connection  ${MCP_IP}  alias=mcp_conn  timeout=100  prompt=$
#    #login  developer  developer1234
#    #login  @{MCP_USER_PASS}
#    #login  &{USER_PASS}
#    login  @{user_pass}
#    get length  ${user_pass}
#
#
#
#
#
#
#
#
#
#    close all connections
#    ${result}=  set variable  Hello
#    [Return]  ${result}


Test list functionality
     @{l}=  create list  10  20  30  40  50
     log  ${l}[0]
     #get length  ${l}

     #get length  ${mylist}
     #log  ${mylist}[0]

     log  ${l}[-1]

     ${index}=  set variable  1
     log  ${l}[${index}]

     log  ${l}[1:]
     junk  ${l}[1:]

Test dictionary functionality
     ${2}=  set variable  two
     ${3}=  set variable  three
     ${d}=  create dictionary  first=1  ${2}=second  third=${3}

     ${TEST_NAME}=  set variable  himanshu
     log  ${TEST_NAME}



#      &{d}=  create dictionary  username=developer  password=developer1234
#      ${len}=  get length  ${d}
#      should be equal as integers  ${len}  2
#      open connection  10.11.40.106
#      login  &{d}
#
#      ${x}=  set variable  10
#      ${x}=  evaluate  ${x}+1
#      log  ${x}




Three argument
    [Arguments]  ${one}  ${two}  ${three}
    log many  ${one}  ${two}  ${three}
    set test variable  ${KSN}  Krishna

    One Required and Two default  shiva
    One Required and Two default  shiva  three=Shyam

One Required and Two default
    [Arguments]  ${one}  ${two}=rama  ${three}=${KSN}
    log many  ${one}  ${two}  ${three}


Any number of argument
    [Arguments]  @{vararg}
    log many  @{vararg}

One or More argument
    [Arguments]  ${required}  @{rest}
    log many  ${required}  @{rest}

Required, var arg and default
    [Arguments]  ${required}  ${optional}=42  @{rest}
    log many  ${required}  ${optional}  @{rest}


argsTest
    argsTest1  abc  def  ghi  jkl  tyui  x=rama  y=krishna
    argsTest2  abc def  shell=True

argsTest1
    [Arguments]  ${req}  ${opt}=shiva  @{vararg}  &{kwargs}
    log many  ${req}  ${opt}  @{vararg}  &{kwargs}

    ${x}=  argsTest3
    log many  ${x}
    @{y}=  argsTest3
    log many  @{y}

    ${w}  @{z}=  argsTest3
    log many  ${w}  @{z}


    ${x}=   set variable  ${10}
    ${x}=   set variable  ${x + 1}


argsTest2
    [Arguments]  @{vararg}  ${shell}=False
    log many  @{vararg}  ${shell}

argsTest3
    [Return]  abc  def  ghi


forLoopTest
    ${employee_name}=  create list  rama  shyam  mohan
    ${index}=  Find Index  ${employee_name}  shyama
    log  ${index}


Find Index
    [Arguments]  ${list}  ${element}

    ${index}=  set variable  ${0}

    FOR  ${item}  IN  @{list}
        log  ${item}
        return from keyword if  '${item}' == '${element}'  ${index}
        ${index}=  set variable  ${index + 1}
    END


    Return from keyword  ${-1}
    [Teardown]  log  teardownDone














retryM
    log  himanshu
    ${res}=  wait until keyword succeeds  2x  10 s  get ping result
    log  ${res}

get ping result
    log  ranjan
    should be equal as integers  ${XY}  11
    log  ranjan1
    [return]  hello