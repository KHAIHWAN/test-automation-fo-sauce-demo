*** Settings ***
Resource    ../1-Resources/common-resources.robot
Resource    ../2-Variables/login-variables.robot
Resource    ../3-Keywords/login-keywords.robot

Suite Setup    เปิดเบราว์เซอร์เต็มหน้าจอ และ ไปยัง URL ที่กำหนด
Suite Teardown    ปิดเบราว์เซอร์

Test Setup    เครียร์ข้อมูลช่อง Username และ Password


*** Test Cases ***
TC-Login-001: ตรวจสอบ Login
    [Documentation]    กรณี ไม่ได้กรอก Username และ Password
    พิมพ์ Username และ Password    ${EMPTY}    ${EMPTY}
    คลิกปุ่ม Login
    ตรวจสอบว่าข้อความแจ้งเตือน ผู้ใช้
    ตรวจสอบตำแหน่ง URL ปัจจุบัน ตรงกับที่ต้องการหรือไม่    ${URL_Main}

TC-Login-002: ตรวจสอบ Login
    [Documentation]    กรณี กรอก Username ถูกต้อง และ ไม่ได้กรอก Password
    พิมพ์ Username และ Password    ${Username_Invalid}    ${EMPTY}
    คลิกปุ่ม Login
    ตรวจสอบว่าข้อความแจ้งเตือน ผู้ใช้
    ตรวจสอบตำแหน่ง URL ปัจจุบัน ตรงกับที่ต้องการหรือไม่    ${URL_Main}

TC-Login-003: ตรวจสอบ Login
    [Documentation]    กรณี กรอก Password ที่ไม่ถูกต้อง และ ไม่ได้กรอก Username 
    พิมพ์ Username และ Password    ${EMPTY}    ${Password_Invalid}
    คลิกปุ่ม Login
    ตรวจสอบว่าข้อความแจ้งเตือน ผู้ใช้
    ตรวจสอบตำแหน่ง URL ปัจจุบัน ตรงกับที่ต้องการหรือไม่    ${URL_Main}

TC-Login-004: ตรวจสอบ Login
    [Documentation]    กรณี กรอก Username และ Password ที่ไม่ถูกต้อง
    พิมพ์ Username และ Password    ${Username_Invalid}    ${Password_Invalid}
    คลิกปุ่ม Login
    ตรวจสอบว่าข้อความแจ้งเตือน ผู้ใช้
    ตรวจสอบตำแหน่ง URL ปัจจุบัน ตรงกับที่ต้องการหรือไม่    ${URL_Main}

TC-Login-005: ตรวจสอบ Login
    [Documentation]    กรณี กรอก Username ที่ถูกต้อง และ ไม่ได้กรอก Password
    พิมพ์ Username และ Password    ${Username_Valid}    ${EMPTY}
    คลิกปุ่ม Login
    ตรวจสอบว่าข้อความแจ้งเตือน ผู้ใช้
    ตรวจสอบตำแหน่ง URL ปัจจุบัน ตรงกับที่ต้องการหรือไม่    ${URL_Main}

TC-Login-006: ตรวจสอบ Login
    [Documentation]    กรณี กรอก Password ที่ถูกต้อง และ ไม่ได้กรอก Username 
    พิมพ์ Username และ Password    ${EMPTY}    ${Password_Valid}
    คลิกปุ่ม Login
    ตรวจสอบว่าข้อความแจ้งเตือน ผู้ใช้
    ตรวจสอบตำแหน่ง URL ปัจจุบัน ตรงกับที่ต้องการหรือไม่    ${URL_Main}

TC-Login-007: ตรวจสอบ Login
    [Documentation]    กรณี กรอก Username และ Password ที่ถูกต้อง
    พิมพ์ Username และ Password    ${Username_Valid}    ${Password_Valid}
    คลิกปุ่ม Login
    ตรวจสอบตำแหน่ง URL ปัจจุบัน ตรงกับที่ต้องการหรือไม่   ${URL_After_Login}
    ออกจากระบบ