*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button} 

*** Test Cases ***
Login To Deriv
	Open Browser    https://app.deriv.com   chrome
	Maximize Browser Window
    Wait Until Page Contains Element    //button[@id='dt_login_button']
    Wait Until Element Contains    dt_login_button    Log in
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10 
    Input Text    //input[@type='email']    a@besquare.com.my
    Input Text    //input[@type='password']    A
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //div[@class="btn-purchase__effect-detail"]    30


Change to Virtual Account
    Set Selenium Speed    1
    Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
    Click Element    dt_core_account-info_acc-info
    Wait Until Page Contains Element    dt_logout_button    30
    Click Element    dt_core_account-switcher_demo-tab
    Click Element    dt_VRTC6756765

Verify
    Wait Until Page Contains Element    //*[@class="dc-icon acc-info__id-icon acc-info__id-icon--virtual"]    30

# Buy rise contract
#     Wait Until Page Contains Element    //*[@class="btn-purchase__info btn-purchase__info--left"]    30
#     Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
#     Set Selenium Speed    2
#     Click Element    //div[@class="cq-symbol-select-btn"] 
#     Click Element    //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "] 
#     Click Element    //div[@class="btn-purchase__info btn-purchase__info--left"] 

Buy lower contract
    Wait Until Page Contains Element    //*[@class="btn-purchase__info btn-purchase__info--left"]    30
    Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
    Set Selenium Speed    2
    Click Element    //div[@class="cq-symbol-select-btn"]  
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "] 
#     Click Element    dt_contract_dropdown
#     Click Element    dt_contract_high_low_item
#     Wait Until Page Contains Element    //input[@name="duration"]    30
#     Click Element    //input[@name="duration"]
#     Press Keys    //*[@class="dc-input__field"]  CTRL+a+BACKSPACE
#     Input Text     //*[@class="dc-input__field"]    4
#     Click Element    dc_payout_toggle_item
#     Press Keys    dt_amount_input    CTRL+a+BACKSPACE
#     Input Text    dt_amount_input    15.50
#     Click Element    //div[@class="btn-purchase__info btn-purchase__info--left"]

# Check Error
#     Click Element    //input[@name="barrier_1"]
#     Press Keys    dt_barrier_1_input    CTRL+a+BACKSPACE
#     Input Text    dt_barrier_1_input    -0.3
#     Click Element    dc_payout_toggle_item
#     Press Keys    dt_amount_input    CTRL+a+BACKSPACE
#     Input Text    dt_amount_input    10
    
Check Multiplier
    Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
    Click Element    dt_contract_dropdown       
    Click Element    dt_contract_multiplier_item   
    Click Element    //div[@class="cq-symbol-select-btn"]  
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--R_50 "]     
