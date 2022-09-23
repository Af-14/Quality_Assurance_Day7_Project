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

# Verify page
#     Sleep    5
#     Wait Until Page Contains Element    //*[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account' and contains(.,'Close my account')]    10

# Check button enabled
#     Element Should Be Enabled    //*[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account' and contains(.,'Close my account')]
#     Element Should Be Enabled    //*[@class='dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel' and contains(.,'Cancel')]

# Cancel close-account__button
#     Wait Until Page Does Not Contain Element    //*[aria-label="Loading Interface..."]    20
#     Click Element    //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]
#     Wait Until Page Contains Element    //*[@class="btn-purchase__info btn-purchase__info--left"]    30

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



# Back button reason_page
#     Sleep    5
#     Click Element    //button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]
#     Wait Until Page Contains Element    //*[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account' and contains(.,'Close')]    10


    






# Check Create Button 
#     Set Selenium Speed    1
#     Wait Until Page Contains Element    /account/closing-account    10
#     Element Should Be Disabled    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]
#     Input Text    //input[@name='token_name']    aa
#     Element Should Be Disabled    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]
#     Press Keys    //input[@name='token_name']  CTRL+a+BACKSPACE
#     Click Element    //.//span[text()='Read']
#     Element Should Be Disabled    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]
#     Wait Until Page Contains Element    //*[@class='dc-field dc-field--error' and contains(.,'Please enter a token name.')]    10
#     Input Text    //input[@name='token_name']    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
#     Wait Until Page Contains Element    //*[@class='dc-input da-api-token__input dc-input__input-group dc-input--error dc-input--hint' and contains(.,'Maximum 32 characters.')]    10
#     Element Should Be Disabled    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]
#     Input Text    //input[@name='token_name']    a....
#     Wait Until Page Contains Element    //*[@class='dc-input da-api-token__input dc-input__input-group dc-input--error dc-input--hint' and contains(.,'Only letters, numbers, and underscores are allowed.')]    10
#     Element Should Be Disabled    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]


# Check Error Message
#     Sleep    5
#     Press Keys    //input[@name='token_name']  CTRL+a+BACKSPACE
#     Input Text    //input[@name='token_name']    a
#     Wait Until Page Contains Element    //*[@class='dc-input da-api-token__input dc-input__input-group dc-input--error dc-input--hint' and contains(.,'Length of token name must be between 2 and 32 characters.')]    10
#     Input Text    //input[@name='token_name']    aa
#     Wait Until Page Contains Element    //*[@class='dc-input__hint' and contains(.,'Length of token name must be between 2 and 32 characters.')]    10
#     Input Text    //input[@name='token_name']    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
#     Wait Until Page Contains Element    //*[@class='dc-input da-api-token__input dc-input__input-group dc-input--error dc-input--hint' and contains(.,'Maximum 32 characters.')]    10
#     Input Text    //input[@name='token_name']    a....
#     Wait Until Page Contains Element    //*[@class='dc-input da-api-token__input dc-input__input-group dc-input--error dc-input--hint' and contains(.,'Only letters, numbers, and underscores are allowed.')]    10

# Create token
#     Input Text    //input[@name='token_name']    aa
#     Sleep    5
#     Click Element    //.//span[text()='Read']
#     Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']

# Delete,copy token for admin scope
#     Sleep    5
#     Input Text    //input[@name='token_name']    aa
#     Wait Until Page Contains Element    //*[@class='dc-input__hint' and contains(.,'Length of token name must be between 2 and 32 characters.')]    10
#     Click Element    //.//span[text()='Read']
#     Click Element    //.//span[text()='Trade']
#     Click Element    //.//span[text()='Payments']
#     Click Element    //.//span[text()='Trading information']
#     Click Element    //.//span[text()='Admin']
#     Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
#     Sleep    5
#     Click ELement    //*[contains(@data-testid,"dt_copy_token_icon")]
#     Sleep    2
#     Wait Until Page Contains Element    //*[@class='dc-modal-body' and contains(.,'Add accounts')]    10
#     Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']
#     Sleep    5
#     Click Element    //*[contains(@class,"dc-icon dc-clipboard da-api-token__delete-icon")]
#     Wait Until Page Contains Element    //*[@class='dc-text' and contains(.,'Are you sure you want to delete this token?')]    10
#     Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']

# Delete,copy token for other than admin scope
#     Sleep    5
#     Input Text    //input[@name='token_name']    aa
#     Wait Until Page Contains Element    //*[@class='dc-input__hint' and contains(.,'Length of token name must be between 2 and 32 characters.')]    10
#     Click Element    //.//span[text()='Read']
#     Click Element    //.//span[text()='Trade']
#     Click Element    //.//span[text()='Payments']
#     Click Element    //.//span[text()='Trading information']
#     Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
#     Sleep    5
#     Click Element    //*[contains(@data-testid,"dt_copy_token_icon")]
#     Wait Until Page Contains Element    //*[@class='dc-clipboard__popover dc-popover__bubble' and contains(.,'Token copied!')]    10
#     Sleep    5
#     Click Element    //*[contains(@class,"dc-icon dc-clipboard da-api-token__delete-icon")]
#     Wait Until Page Contains Element    //*[@class='dc-text' and contains(.,'Are you sure you want to delete this token?')]    10
#     Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']

# Token Visibility 
#     Sleep    5
#     Click Element    //*[contains(@data-testid,"dt_toggle_visibility_icon")]
    
