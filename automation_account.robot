*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button} 

*** Test Cases ***
Login To Deriv
	Open Browser    https://app.deriv.com/account/closing-account   chrome
	Maximize Browser Window
    Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20    
    Wait Until Page Contains Element    //input[@type='email']    10 
    Input Text    //input[@type='email']    afifi+3@besquare.com.my
    Input Text    //input[@type='password']    Asdf1234
    Click Element    //button[@type='submit']

Verify page
    Sleep    5
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account' and contains(.,'Close my account')]    10

Check button enabled
    Element Should Be Enabled    //*[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account' and contains(.,'Close my account')]
    Element Should Be Enabled    //*[@class='dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel' and contains(.,'Cancel')]

Cancel close-account__button
    Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
    Click Element    //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]
    Wait Until Page Contains Element    //*[@class="btn-purchase__info btn-purchase__info--left"]    30

Close my account__button
    Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
    Sleep    5
    Click Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']
    Wait Until Page Contains Element    //*[@class='dc-checkbox closing-account-reasons__checkbox' and contains(.,'I have other financial priorities.')]    10

Reason Page
    Element Should Be Disabled    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large" and contains(.,'Continue')]
    Element Should Be Enabled    //*[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large" and contains(.,'Back')]
    Click Element    //.//span[text()='I have other financial priorities.']
    Sleep    5
    Element Should Be Enabled    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large" and contains(.,'Continue')]

Click More Than 3 Reason
    Click Element    //.//span[text()='I’m no longer interested in trading.']
    Click Element    //.//span[text()='I want to stop myself from trading.']
    Sleep    5
    Element Should Be Disabled    //.//span[text()='Making deposits and withdrawals is difficult.']



Back button reason_page
    Sleep    5
    Click Element    //button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account' and contains(.,'Close')]    10


    






