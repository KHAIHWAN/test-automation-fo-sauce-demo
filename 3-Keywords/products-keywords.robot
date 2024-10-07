*** Settings ***
Resource    ../1-Resources/common-resources.robot
Resource    ../2-Variables/products-variables.robot

*** Keywords ***
คลิกปุ่ม Filter โดยเลือก Keywords
    [Arguments]    ${Filter_Option}
    Select From List By Value    css=.product_sort_container    ${Filter_Option}

ตรวจสอบว่า รายการสินค้าเรียงตามที่ต้องการไหม
    [Arguments]    ${Filter_Option}

    IF    $Filter_Option == 'az' or $Filter_Option == 'za'
        ${Products}    Get WebElements    css=.inventory_item_name
        ${Products_Text}    Create List
    ELSE IF    $Filter_Option == 'lohi' or $Filter_Option == 'hilo'
        ${Products}    Get WebElements    css=.inventory_item_price
        ${Products_Text}    Create List
    END
    
    FOR    ${Product}    IN    @{Products}
        ${Product_Text}    Get Text    ${Product}
        IF    $Filter_Option == 'lohi' or $Filter_Option == 'hilo'
            ${Clean_String}    Replace String    ${Product_Text}    $    ${EMPTY}
            ${Product_Text}    Convert To Number    ${Clean_String}
        END
    END

    ${Expected_Products_Text}    Copy List    ${Products_Text}
    Sort List    ${Expected_Products_Text}

    IF    $Filter_Option == 'za' or $Filter_Option == 'hilo'
        Reverse List    ${Expected_Products_Text}
    END

    Lists Should Be Equal    ${Products_Text}    ${Expected_Products_Text}

