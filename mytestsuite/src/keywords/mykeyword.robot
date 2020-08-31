*** Settings ***
Library         OperatingSystem
Resource        anotherkeyword.robot
Library         libraries/myanotherutil.py

*** Keywords ***
Connect to MCP
    Log  "Connecting to MCP"
    ${result}=  Set Variable  "Connected to MCP"
    Connect to OLT
    Log  ${CURDIR}
    ${age}=  get age
    Log  ${age}
    [Return]  ${result}
