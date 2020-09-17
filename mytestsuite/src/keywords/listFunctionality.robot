*** Settings ***
Library         OperatingSystem
Library         SSHLibrary
Library         libraries/myanotherutil.py
Resource        anotherkeyword.robot



*** Variables ***
${MCP_IP}   10.11.24.59

@{mylist}   100  200  300

@{MCP_USER_PASS}  developer  developer1234

#{MCP}  is a string here, not list
${MCP}   developer  developer1234



*** Keywords ***

Test List Functionality
    #create the list and assign to scalar variable
    ${employee_list}=  create list  rama  shyam  mohan

    # access the element
    ${x}=  set variable  ${employee_list}[1]

    #access using index variable
    ${index}=   set variable  1
    ${x}=  set variable  ${employee_list}[${index}]

    #access by python slice way
    ${x}=  set variable  ${employee_list}[-1]

    # x is list, not an element
    ${x}=  set variable  ${employee_list}[2:]


Test List Variable
    # list variable is @

    # create a list using $ first then using @ and show the difference
    ${user_pass}=  create list  developer  developer1234

    #${len}=  get length  @{user_pass}
    ${len}=   get length  ${user_pass}


    # open a connection and Login

    open connection  ${MCP_IP}

    #Login  ${user_pass}
    #Login  @{user_pass}

    Login  @{user_pass}



    @{user_pass}=  create list  developer  developer1234

    #${len}=  get length  @{user_pass}
    ${len}=   get length  ${user_pass}

    # open a connection and Login

    open connection  ${MCP_IP}

    #Login  ${user_pass}
    Login  @{user_pass}


    close all connections

