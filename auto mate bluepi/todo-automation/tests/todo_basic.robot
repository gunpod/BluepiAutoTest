*** Settings ***
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Suite Teardown    Close App

*** Test Cases ***
TC-AUTO-01 Add Complete Delete Task
    Open Todo App
    Add Task    Check
    Verify Task Exists In Incomplete    Check
    Mark Task As Complete By Name       Check
    Verify Task Exists In Completed     Check
    Delete Completed Task By Name       Check
    Verify Task Not In Completed        Check
