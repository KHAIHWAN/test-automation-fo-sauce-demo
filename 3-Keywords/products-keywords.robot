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

คลิกปุ่มเพิ่มสินค้า ทั้งหมด
    ${Buttons_Add_To_Cart}    Get WebElements    ${Button_Add_To_Cart}
    FOR    ${Button}    IN    @{Buttons_Add_To_Cart}
        Click Element    ${Button}
    END

คลิกปุ่มยกเลิกสินค้า ทั้งหมด
    ${Buttons_Remove}    Get WebElements    ${Button_Remove}
    FOR    ${Button}    IN    @{Buttons_Remove}
        Click Element    ${Button}
    END

ตรวจสอบ การอัปเดตค่าของ ตะกร้าสินค้า
    ${Buttons_Add_To_Cart}    Get WebElements    ${Button_Add_To_Cart}

    FOR    ${Button}    IN    @{Buttons_Add_To_Cart}
        Click Element    ${Button}
        ${Count_Clicked}    Evaluate    ${Count_Clicked} + 1
        

        ${Cart_Count_Text}    Get Text    ${Cart_Count}
        ${Cart_Count_Text}    Convert To Number    ${Cart_Count_Text}

        Should Be Equal As Numbers    ${Count_Clicked}    ${Cart_Count_Text}
        Log To Console    จำนวนที่กดปุ่มเพิ่มสินค้า: ${Count_Clicked} จำนวนสินค้าในตะกร้า: ${Cart_Count_Text}
    END

ตรวจสอบ การลดค่าของ ตะกร้าสินค้า
    ${Cart_Count_Text}    Get Text    ${Cart_Count}
    ${Count_Clicked}    Set Variable    ${Cart_Count_Text}
    ${Count_Clicked}    Convert To Number    ${Count_Clicked}
    Log To Console    จำนวนสินค้าในตะกร้า: ${Count_Clicked}

    ${Buttons_Remove}    Get WebElements    ${Button_Remove}

    FOR    ${Button}    IN    @{Buttons_Remove}
        Sleep    1s
        Click Element    ${Button}
        ${Count_Clicked}    Evaluate    ${Count_Clicked} - 1
        IF   ${Count_Clicked} > 0
            ${New_Cart_Count_Text}    Get Text    ${Cart_Count}
            ${New_Cart_Count_Text}    Convert To Number    ${New_Cart_Count_Text}
            
            Should Be Equal As Numbers    ${Count_Clicked}    ${New_Cart_Count_Text}
            Log To Console    จำนวนที่กดปุ่มยกเลิกสินค้า: ${Count_Clicked} จำนวนสินค้าในตะกร้า: ${New_Cart_Count_Text}
        ELSE IF    ${Count_Clicked} == 0
            Element Should Not Be Visible    ${Cart_Count}
            Log To Console    จำนวนสินค้าในตะกร้า: ${Count_Clicked}
        END
    END