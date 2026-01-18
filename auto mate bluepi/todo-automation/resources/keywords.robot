*** Settings ***
Library    SeleniumLibrary

# เอา resources จากที่แยกไว้นำเข้ามา
Resource   ../resources/locators.robot


*** Keywords ***
Open Todo App
    # เปิด browser ไปที่ URL ของเว็บ To-Do List
    Open Browser    ${URL}    chrome
    # ขยายหน้าจอให้เต็ม 
    Maximize Browser Window
    # รอจนช่อง input พร้อมใช้งาน เพื่อกันหน้าโหลดไม่ทัน
    Wait Until Element Is Visible    ${INPUT_TASK}    10s


Add Task
    [Arguments]    ${task}
    # ล้างข้อความเก่าใน input กันกรณีเคยพิมพ์ค้าง
    Clear Element Text    ${INPUT_TASK}
    # พิมพ์ชื่อ task ลงใน input
    Input Text            ${INPUT_TASK}    ${task}
    # คลิกปุ่ม Add เพื่อเพิ่ม task
    Click Button          ${BTN_ADD}
    # รอให้ task ปรากฏในรายการ incomplete เพื่อยืนยันว่า add สำเร็จจริง
    Wait Until Page Contains Element
    ...    xpath://ul[@id='incomplete-tasks']//li[.//span[normalize-space()='${task}']]    10s


Verify Task Exists In Incomplete
    [Arguments]    ${task}
    # ตรวจสอบว่า task อยู่ในรายการ incomplete
    Wait Until Page Contains Element
    ...    xpath://ul[@id='incomplete-tasks']//li[.//span[normalize-space()='${task}']]    10s


Mark Task As Complete By Name
    [Arguments]    ${task}
    # หา checkbox ของ task จากชื่อ แล้วคลิกให้เป็น completed
    ${checkbox}=    Set Variable
    ...    xpath://ul[@id='incomplete-tasks']//li[.//span[normalize-space()='${task}']]//input[@type='checkbox' or contains(@class,'mdl-checkbox__input')]
    Click Element    ${checkbox}
    # หลังคลิก รอให้ task หายออกจาก incomplete ก่อน เพื่อยืนยันว่าถูกย้ายจริง
    Wait Until Page Does Not Contain Element
    ...    xpath://ul[@id='incomplete-tasks']//li[.//span[normalize-space()='${task}']]    10s


Verify Task Exists In Completed
    [Arguments]    ${task}
    #คลิกแท็บ Completed ก่อน เผื่อบางครั้ง list completed ยังไม่แสดง
    Click Element    ${TAB_COMPLETED}
    # รอให้ task ปรากฏในรายการ completed
    Wait Until Page Contains Element
    ...    xpath://ul[@id='completed-tasks']//li[.//span[normalize-space()='${task}']]    10s


Delete Completed Task By Name
    [Arguments]    ${task}
    # เข้าแท็บ Completed 
    Click Element    ${TAB_COMPLETED}
    # ใช้ xpath เพราะยืดหยุ่นกว่า หา element ที่เป็นปุ่ม/ไอคอนลบภายใน li ของ task นั้น
    ${delete_btn}=    Set Variable
    ...    xpath://ul[@id='completed-tasks']//li[.//span[normalize-space()='${task}']]//*[self::button or self::span][contains(@class,'delete') or contains(@class,'material-icons') or normalize-space()='delete']
    Click Element    ${delete_btn}


Verify Task Not In Completed
    [Arguments]    ${task}
    # ตรวจสอบว่า task ถูกลบแล้วจริง
    Wait Until Page Does Not Contain Element
    ...    xpath://ul[@id='completed-tasks']//li[.//span[normalize-space()='${task}']]    10s


Close App
    # ปิด browser จบ test
    Close Browser
