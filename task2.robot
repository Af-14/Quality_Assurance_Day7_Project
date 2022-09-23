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
    Click Element    dt_core_account-info_acc-info
    Wait Until Page Contains Element    dt_logout_button    30
    Click Element    dt_core_account-switcher_demo-tab
    Click Element    dt_VRTC6756765

Verify
    Wait Until Page Contains Element    //*[@class="dc-icon acc-info__id-icon acc-info__id-icon--virtual"]    30

Select volatility
    Wait Until Page Contains Element    //*[@class="btn-purchase__info btn-purchase__info--left"]    30
    Set Selenium Speed    2
    Click Element    //div[@class="cq-symbol-select-btn"] 
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "] 
    Click Element    //div[@class="btn-purchase__info btn-purchase__info--left"] 
      

