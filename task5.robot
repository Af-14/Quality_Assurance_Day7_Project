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
    Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
    Wait Until Page Contains Element    //input[@type='email']    10 
    Input Text    //input[@type='email']    afifi+3@besquare.com.my
    Input Text    //input[@type='password']    Asdf1234
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


Check Multiplier
    Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
    Sleep    5
    Click Element    dt_contract_dropdown       
    Click Element    dt_contract_multiplier_item  
    Sleep    5
    Click Element    //div[@class="cq-symbol-select-btn"]  
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--R_50 "]   

# Check multiplier value selection 
#     Click Element  //div[@id='dropdown-display']
#     Sleep    3
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'20')]    10
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'40')]    10
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'60')]    10
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'100')]    10
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'200')]    10

# Click on Trade types dropdown
#     Wait Until Page Contains Element  //div[@data-testid='dt_contract_dropdown']  100
#     Click Element  //div[@data-testid='dt_contract_dropdown']
#     Sleep    2
#     Wait Until Page Contains Element  //div[@class='trade-container__fieldset-header trade-container__fieldset-header--inline']  200
    
# Only deal cancellation or take profit / stop loss is allowed
#     Sleep    10
#     Click Element  //.//span[text()='Deal cancellation']
#     Checkbox Should Be Selected  //input[@id='dt_cancellation-checkbox_input']
#     Sleep    2
#     Wait Until Element Is Visible  //*[contains(text(), 'Take profit')]  50
#     Wait Until Element Is Visible  //*[contains(text(), 'Stop loss')]  50
#     Click Element  //*[contains(text(), 'Take profit')]
#     Click Element  //*[contains(text(), 'Stop loss')]
#     Checkbox Should Be Selected  //input[@id='dc_take_profit-checkbox_input']
#     Checkbox Should Be Selected  //input[@id='dc_stop_loss-checkbox_input']
#     Checkbox Should Not Be Selected  //input[@id='dt_cancellation-checkbox_input']

# Check deal cancellation duration
#     Click Element  //.//span[text()='Deal cancellation']
#     Sleep    2
#     Click Element  //*[@class="dc-dropdown__display dc-dropdown__display--no-border" and contains(.,'minutes') ]
#     Sleep    3
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'5')]    10
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'10')]    10
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'15')]    10
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'30')]    10
#     Wait Until Page Contains Element    //div[@data-testid="dti_list_item" and contains(.,'60')]    10

Check single click
    Sleep    5
    Wait Until Page Contains Element    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input" and contains(.,'10')]    10
    Click Element    //button[@class="dc-btn dc-input-wrapper__button dc-input-wrapper__button--increment"]
    Wait Until Page Contains Element    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input" and contains(.,'11')]    10
    Click Element    //button[@class="dc-btn dc-input-wrapper__button dc-input-wrapper__button--decrement"]
    Wait Until Page Contains Element    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input" and contains(.,'10')]    10


# Key points:

# a. Only stake is allowed. Should not have payout option

# b. Only deal cancellation or take profit/stop loss is allowed

# c. Multiplier value selection should have x20, x40, x60, x100, x200

# d. Deal cancellation fee should correlate with the stake value (e.g. deal cancellation fee is more
# expensive when the stake is higher)

# e. Maximum stake is 2000 USD

# f. Minimum stake is 1 USD

# g. Single click on plus (+) button of take profit field should increase the take profit value by 1 USD

# h. Single click on minus (-) button of take profit field should decrease the take profit value by 1
# USD

# i. Deal cancellation duration only has these options: 5, 10, 15, 30 and 60 min  
