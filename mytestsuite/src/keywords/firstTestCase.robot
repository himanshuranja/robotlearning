*** Settings ***
Library         OperatingSystem
Library         SSHLibrary
Library         libraries/myanotherutil.py
Resource        anotherkeyword.robot



*** Variables ***
@{mylist}   100  200  300

@{MCP_USER_PASS}  developer  developer1234

${MCP_IP}   10.11.12.21

&{USER_PASS}     username=developer  password=developer1234



*** Keywords ***

Connect to Device
    [Documentation]  this is just a docmentaion example
    [Tags]  abc  def
    log  connecting to Device

    ${res}=  Connect to OLT
    log  ${res}

    log  ${CURDIR}

    ${name}=    get age
    Log  ${name}

    ${x}=  set variable  10
    should be equal as integers  ${x}  10
    [Return]  Connected