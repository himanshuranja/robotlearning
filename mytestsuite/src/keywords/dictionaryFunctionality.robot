*** Settings ***
Library         OperatingSystem
Library         SSHLibrary
Library         libraries/myanotherutil.py
Resource        anotherkeyword.robot



*** Variables ***
${MCP_IP}   10.11.24.59

@{MCP_USER_PASS}  developer  developer1234


&{MCP_USER_PASS_DICT}   username=developer  password=developer1234



*** Keywords ***

Test Dictionary Functionality
    #create the dictionary and assign to scalar variable
    ${2}=  set variable  two
    ${3}=  set variable  three
    ${d}=  create dictionary  first=1  ${2}=second  third=${3}

    # access items in dictionary
    ${x}=  set variable  ${d}[third]
    ${x}=  set variable  ${d}[${2}]

    # access item using key variable
    ${key}=   set variable  third
    ${x}=  set variable  ${d}[${key}]

    # access item using attributes
    ${x}=  set variable  ${d.first}
    ${x}=  set variable  ${d.${2}}



Test Dictionary Variable
    # dictionary variable is &

    # create a dictionary using $ first then using & and show the difference
    ${user_pass}=  create dictionary  username=developer  password=developer1234

    #${len}=  get length  &{user_pass}
    ${len}=  get length  ${user_pass}

    # open a connection and Login
    open connection  ${MCP_IP}

    #Login  ${user_pass}
    Login  &{user_pass}



    # create dict using &
    &{user_pass}=  create dictionary  username=developer  password=developer1234

    #${len}=  get length  &{user_pass}
    ${len}=  get length  ${user_pass}

    # open a connection and Login

    open connection  ${MCP_IP}

    #Login  ${user_pass}
    Login  &{user_pass}

    close all connections



