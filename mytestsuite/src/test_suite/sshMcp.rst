

.. code:: robotframework

    *** Settings ***
    Library        OperatingSystem
    Resource       keywords/mykeyword.robot
    Library        libraries/myutil.py


    *** Variables ***
    ${USER_NAME}    Himanshu


    *** Test Cases ***

    #User can login to MCP
        #[Tags]  abc
        #${x}=  Set Variable  10  20
        #Log  ${x}
        #Log  ${CURDIR}
        #${result}=    Connect to MCP
        #Log  ${result}
        #${name}=    get name
        #Log  ${name}
        #Log  ${USER_NAME}

        #Test list functionality
        #Test dictionary functionality



    #User1 can login to MCP
        #[Tags]  def
        #${result}=    Connect to MCP


    Argument Test
        #Three argument  rama  krishna  10
        #Any number of argument  abc  def  10
        #One or More argument  shiva  rama  krishna
        #Required, var arg and default  rama
        #argsTest
        forLoopTest






    #retryTest
        #retryM