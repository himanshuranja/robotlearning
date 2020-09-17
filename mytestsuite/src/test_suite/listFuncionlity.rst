

.. code:: robotframework

    *** Settings ***
    Library        OperatingSystem
    Library        libraries/myutil.py
    Resource       keywords/listFunctionality.robot


    *** Variables ***
    ${USER_NAME}    Himanshu


    *** Test Cases ***
    Testing The List Functionality
        Test List Functionality

    Testing The List variable
        Test List Variable


