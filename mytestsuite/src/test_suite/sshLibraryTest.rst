

.. code:: robotframework

    *** Settings ***
    Resource       keywords/sshLibraryTest.robot



    *** Variables ***
    ${USER_NAME}    Himanshu


    *** Test Cases ***

    User can login to MCP
        ${result}=    Connect to MCP
        Log  ${result}

    User can login to MCP where timeout is changed for different call and restored back
        Connect to MCP and change the default parameter of current connection and restore it back