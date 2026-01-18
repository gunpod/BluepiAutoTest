*** Variables ***
# URL ของเว็บ To-Do List 
${URL}               https://abhigyank.github.io/To-Do-List/

# ช่อง input สำหรับพิมพ์ชื่อ task
${INPUT_TASK}        css:input.mdl-textfield__input

# ปุ่ม Add สำหรับเพิ่ม task เข้าไปในรายการ
# ระบุให้ชัดเจนว่าเป็นปุ่มภายใต้ container add-item
${BTN_ADD}           css:#add-item button

# รายการ task ที่ยังไม่เสร็จ 
# ใช้สำหรับตรวจสอบว่า task ถูกเพิ่มเข้ามาถูกต้องหรือไม่
${INCOMPLETE_LIST}   css:#incomplete-tasks

# รายการ task ที่ทำเสร็จแล้ว 
# ใช้ตรวจสอบว่า task ถูกย้ายมาหลังจาก mark complete
${COMPLETED_LIST}    css:#completed-tasks

# แท็บ To-Do
# ใช้ xpath แบบ contains เพื่อให้ locator เผื่อมีการเปลี่ยนข้อความเล็กน้อย
${TAB_TODO}          xpath://a[contains(.,'To-Do') or contains(.,'To Do') or contains(.,'To-Do Tasks')]

# แท็บ Completed
# ใช้ xpath เพื่อค้นหาจากข้อความของแท็บ
${TAB_COMPLETED}     xpath://a[contains(.,'Completed')]
