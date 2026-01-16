*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Todo App
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_TASK}    10s

Add Task
    [Arguments]    ${task}
    Clear Element Text    ${INPUT_TASK}
    Input Text            ${INPUT_TASK}    ${task}
    Click Button          ${BTN_ADD}

Verify Task Exists In Incomplete
    [Arguments]    ${task}
    Wait Until Page Contains Element
    ...    xpath://ul[@id='incomplete-tasks']//li[.//span[normalize-space()='${task}']]    10s

Mark Task As Complete By Name
    [Arguments]    ${task}
    ${checkbox}=    Set Variable
    ...    xpath://ul[@id='incomplete-tasks']//li[.//span[normalize-space()='${task}']]//input[@type='checkbox' or contains(@class,'mdl-checkbox__input')]
    Click Element    ${checkbox}

Verify Task Exists In Completed
    [Arguments]    ${task}
    Wait Until Page Contains Element
    ...    xpath://ul[@id='completed-tasks']//li[.//span[normalize-space()='${task}']]    10s

Delete Completed Task By Name
    [Arguments]    ${task}
    ${btn}=    Set Variable
    ...    xpath://ul[@id='completed-tasks']//li[.//span[normalize-space()='${task}']]//button
    Click Element    ${btn}

Verify Task Not In Completed
    [Arguments]    ${task}
    Wait Until Page Does Not Contain Element
    ...    xpath://ul[@id='completed-tasks']//li[.//span[normalize-space()='${task}']]    10s

Close App
    Close Browser
