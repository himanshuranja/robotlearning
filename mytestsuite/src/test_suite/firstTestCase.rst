

.. code:: robotframework

    *** Settings ***
    Library        OperatingSystem
    Library        libraries/myutil.py
    Resource       keywords/firstTestCase.robot


    *** Variables ***
    ${USER_NAME}    Himanshu


    *** Test Cases ***
    User can login to Device
        ${x}=  Set Variable  10
        Log  ${x}
        Log  ${CURDIR}
        ${result}=    Connect to Device
        Log  ${result}
        ${name}=  get name
        Log  ${name}
        Log  ${USER_NAME}







