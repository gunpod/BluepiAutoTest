*** Variables ***
${URL}               https://abhigyank.github.io/To-Do-List/

${INPUT_TASK}        css:input.mdl-textfield__input
${BTN_ADD}           css:#add-item button

${INCOMPLETE_LIST}   css:#incomplete-tasks
${COMPLETED_LIST}    css:#completed-tasks

# Tabs (ใช้ contains เพื่อทนต่อการเปลี่ยน text เล็กน้อย)
${TAB_TODO}          xpath://a[contains(.,'To-Do') or contains(.,'To Do') or contains(.,'To-Do Tasks')]
${TAB_COMPLETED}     xpath://a[contains(.,'Completed')]
