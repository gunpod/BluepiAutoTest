# Todo List Automation - Robot Framework
## เป้าหมายของโปรเจกต์นี้
โปรเจกต์นี้ใช้ Robot Framework เพื่อทดสอบเว็บ To-Do List แบบ end-to-end
สิ่งที่เทส คือ เพิ่มงานใหม่ ทำให้เป็น completed แล้วลบออก และตรวจสอบผลในแต่ละขั้นตอน

## Tech
- Robot Framework
- SeleniumLibrary
- Chrome browser

## Setup
```bash
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate

pip install -r requirements.txt

## test
