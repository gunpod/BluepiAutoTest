*** Settings ***
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Suite Teardown    Close App

*** Test Cases ***
TC-AUTO-01 Add Complete Delete Task
    # เปิดหน้าเว็บ To-Do List และรอให้พร้อมใช้งาน
    Open Todo App
    # เพิ่ม task ใหม่ชื่อว่า "Check"
    Add Task    Check
    # ตรวจสอบว่า task "Check" อยู่ในรายการ Incomplete
    Verify Task Exists In Incomplete    Check
    # ทำเครื่องหมาย task "Check" ว่าเสร็จ (ย้ายไป Completed)
    Mark Task As Complete By Name       Check
    # ตรวจสอบว่า task "Check" ปรากฏในรายการ Completed
    Verify Task Exists In Completed     Check
    # ลบ task "Check" ออกจากรายการ Completed
    Delete Completed Task By Name       Check
    # ตรวจสอบว่า task "Check" ไม่เหลืออยู่ใน Completed อีกต่อไป
    Verify Task Not In Completed        Check
