*** Settings ***
Library    SeleniumLibrary
Library    Collections    # ใช้สำหรับการจัดการข้อมูลที่เป็น List
Library    String    # ใช้สำหรับการจัดการข้อมูลที่เป็น String

*** Variables ***
${Browser}                 Chrome
${URL_Main}                https://www.saucedemo.com/
${URL_After_Login}        ${URL_Main}inventory.html

${Username_Standard}    standard_user
${Password_Standard}    secret_sauce

*** Keywords ***
เปิดเบราว์เซอร์เต็มหน้าจอ และ ไปยัง URL ที่กำหนด
    Open Browser    ${URL_Main}    ${Browser}
    Maximize Browser Window
ปิดเบราว์เซอร์
    Close Browser

เข้าสู่ระบบเพื่อทดสอบ ระบบภายใน
    เปิดเบราว์เซอร์เต็มหน้าจอ และ ไปยัง URL ที่กำหนด
    Input Text    user-name    ${Username_Standard}
    Input Text    password    ${Password_Standard}
    Click Button    login-button

ออกจากระบบ
    Click Button    id=react-burger-menu-btn
    Sleep    0.5s
    Click Element   id=logout_sidebar_link

ออกจากระบบ และ ปิดเบราว์เซอร์
    ออกจากระบบ
    ปิดเบราว์เซอร์