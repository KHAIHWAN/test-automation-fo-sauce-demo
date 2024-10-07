*** Settings ***
Resource    ../1-Resources/common-resources.robot
Resource    ../2-Variables/products-variables.robot
Resource    ../3-Keywords/products-keywords.robot

Suite Setup    เข้าสู่ระบบเพื่อทดสอบ ระบบภายใน
Suite Teardown    ออกจากระบบ และ ปิดเบราว์เซอร์
*** Test Cases ***
TC-Products-001: ตรวจสอบ Filter
    [Documentation]    กรณี ให้แสดง ชื่อรายการสินค้า เรียงจาก A ถึง Z
    คลิกปุ่ม Filter โดยเลือก Keywords    ${Filter_Option_AtoZ}
    ตรวจสอบว่า รายการสินค้าเรียงตามที่ต้องการไหม    ${Filter_Option_AtoZ}

TC-Products-002: ตรวจสอบ Filter
    [Documentation]    กรณี ให้แสดง ชื่อรายการสินค้า เรียงจาก Z ถึง A
    คลิกปุ่ม Filter โดยเลือก Keywords    ${Filter_Option_ZtoA}
    ตรวจสอบว่า รายการสินค้าเรียงตามที่ต้องการไหม    ${Filter_Option_ZtoA}

TC-Products-003: ตรวจสอบ Filter
    [Documentation]    กรณี ให้แสดง ราคารายการสินค้า เรียงจาก น้อยสุด ไป มากสุด
    คลิกปุ่ม Filter โดยเลือก Keywords    ${Filter_Option_LoToHi}
    ตรวจสอบว่า รายการสินค้าเรียงตามที่ต้องการไหม    ${Filter_Option_LoToHi}

TC-Products-004: ตรวจสอบ Filter
    [Documentation]    กรณี ให้แสดง ราคารายการสินค้า เรียงจาก มากสุด ไป น้อยสุด
    คลิกปุ่ม Filter โดยเลือก Keywords    ${Filter_Option_HiToLo}
    ตรวจสอบว่า รายการสินค้าเรียงตามที่ต้องการไหม    ${Filter_Option_HiToLo}