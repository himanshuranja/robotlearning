.. code:: robotframework

    *** Settings ***
    Library        OperatingSystem
    Resource       keywords/mykeyword.robot
    Library        libraries/myutil.py

    *** Test Cases ***

    User can login to MCP
        ${x}=  Set Variable  10
        Log  ${CURDIR}
        ${result}=  Connect to MCP
        Log  ${result}
        ${name}=  get name
        Log  ${name}
