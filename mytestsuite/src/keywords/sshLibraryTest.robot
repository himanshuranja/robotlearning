*** Settings ***
Library         SSHLibrary




*** Variables ***
@{mylist}   100  200  300

@{MCP_USER_PASS}  developer  developer1234

${MCP_IP}   10.11.24.59

&{USER_PASS}     username=developer  password=developer1234



*** Keywords ***

Connect to MCP
    # we can have only one connection active at a time in the framework ( usually )
    # for multiple connection to be active, sshlibrary is imported in a different way like 'Library SSHLibrary WITH NAME MCP

    ${server_index_mcp}=  open connection  ${MCP_IP}  prompt=$  timeout=10  alias=mcp_conn
    login  @{MCP_USER_PASS}

    # get connection  returns about current connection
    ${rc}=  get connection
    Log  ${rc}

    write  ls -l

    #${output}=  read until  @
    ${output}=  read until prompt


    open connection  127.0.0.1  timeout=5  prompt=$
    login  developer  developer1234
    ${rc}=  get connection
    Log  ${rc}

    write  ls -l

    ${output}=  read until prompt

    # any further API call will be invoked on current connection.
    # but if we want to invoke something on erlier connection then we can switch back to that connection.

    switch connection  mcp_conn
    #switch connection  ${server_index_mcp}
    write  ls -l

    ${output}=  read until prompt
    
    ${all_conn}=  get connections     # returns all connections

    close all connections




Connect to MCP and change the default parameter of current connection and restore it back
    # we can have only one connection active at a time in the framework ( usually )
    # for multiple connection to be active, sshlibrary is imported in a different way like 'Library SSHLibrary WITH NAME MCP

    ${server_index_mcp}=  open connection  ${MCP_IP}  prompt=$  timeout=10  alias=mcp_conn
    login  @{MCP_USER_PASS}

    ${rc}=  get connection
    Log  ${rc}

    write  ls -l

    #${output}=  read until  @
    ${output}=  read until prompt


    # change the timeout of current connection to 100 seconds and once we are done then restore the original back.
    # store timeout of current connection in temp variable. do not rely on ${rc} as it is a reference which is going to change if other connecton is opened.
    # rc is dict, therefore ${rc.timeout}
    ${orig_timeout}=  set variable  ${rc.timeout}
    log  ${orig_timeout}

    set client configuration  timeout=100

    ${rc}=  get connection
    Log  ${rc}

    write  ls -l

    ${output}=  read until prompt

    # restore original timeout so that other test cases are not affected
    set client configuration  timeout=${orig_timeout}

    ${rc}=  get connection
    Log  ${rc}

    close all connections





