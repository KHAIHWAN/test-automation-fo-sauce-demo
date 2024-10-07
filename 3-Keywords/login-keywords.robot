*** Settings ***
Resource    ../1-Resources/common-resources.robot
Resource    ../2-Variables/login-variables.robot

*** Keywords ***
พิมพ์ Username และ Password
    [Arguments]    ${Username}    ${Password}
    Input Text    user-name    ${Username}
    Input Text    password    ${Password}

คลิกปุ่ม Login
    Click Button    login-button

ตรวจสอบว่าข้อความแจ้งเตือน ผู้ใช้
    ${Error_Message}    Get Text    css=.error-message-container h3
    Log To Console    message=ข้อความแจ้งเตือนผู้ใช้คือ: ${Error_Message}

ตรวจสอบตำแหน่ง URL ปัจจุบัน ตรงกับที่ต้องการหรือไม่
    [Arguments]    ${URL_Expected}
    ${URL_Current}    Get Location
    IF    $URL_Current != $URL_Expected
        Fail    URL ปัจจุบัน ไม่ตรงกับที่ต้องการ
    ELSE
        Log To Console   message=URL ปัจจุบัน ตรงกับที่ต้องการ: ${URL_Expected}
    END

เครียร์ข้อมูลช่อง Username และ Password
    Press Keys    id=user-name    CTRL+A    BACKSPACE
    Press Keys    id=password    CTRL+A    BACKSPACE
