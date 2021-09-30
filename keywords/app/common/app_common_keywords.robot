*** Variables ***
${APPGLOBALTIMEOUT}     ${60}

&{dictCommonPage}
...    btn_eng_lang=android=UiSelector().resourceIdMatches(".*id/buttonLangEnglish$")
...    btn_skip=android=UiSelector().resourceIdMatches(".*id/buttonSkip$")
...    btn_allow_location=android=UiSelector().resourceIdMatches(".*id/buttonTurnOn$")

*** Keywords ***
Guest - Open CDS Application And Step To Homepage
    [Arguments]    ${device_info}
    Open CDS Application    ${device_info}
    Select english language
    Click allow tracking location
    Click skip button

Open CDS Application
    [Documentation]    Opens a new application to Appium server with capabilities
    ...                ${device_info}    - Device info in dictionary type
    [Arguments]    ${device_info}
    ${caps}    Create Dictionary
    ...    deviceName    ${device_info.deviceName}
    ...    platformName    ${device_info.platformName}
    ...    platformVersion    ${device_info.platformVersion}
    ...    app  ${device_info.app}
    ...    newCommandTimeout    ${device_info.newCommandTimeout}
    ...    noReset    ${device_info.noReset}
    ...    autoGrantPermissions    ${device_info.autoGrantPermissions}
    AppiumLibrary.Open Application   http://localhost:4723/wd/hub    &{caps}

Launch CDS Application
    [Documentation]    Launch application while Appium session running
    AppiumLibrary.Launch Application

Close CDS Application
    [Documentation]    Close current application while Appium session running
    Run Keyword And Ignore Error    AppiumLibrary.Close Application

Select english language
    [Documentation]    Select english language at welcome page
    app_common_keywords.Click Element    ${dictCommonPage}[btn_eng_lang]

Click skip button
    [Documentation]    Select skip button at welcome page
    app_common_keywords.Click Element    ${dictCommonPage}[btn_skip]

Click allow tracking location
    [Documentation]    Select allow tracking button at welcome page
    app_common_keywords.Click Element    ${dictCommonPage}[btn_allow_location]

Get Elements
    [Documentation]    This keyword for getting elements after verify these elements is visible
    ...                ${elems}    - Varargs of locators or elements
    [Arguments]    @{elems}
    Verify Elements Are Visible    @{elems}
    @{elements}    AppiumLibrary.Get Webelements    @{elems}
    [Return]    @{elements}
    
Get Text
    [Documentation]    Get text of target element
    ...                ${locator}    - Locator of target element
    [Arguments]    ${locator}
    app_common_keywords.Wait Element Is Visible    ${locator}
    ${text}    AppiumLibrary.Get Text    ${locator}
    [Return]    ${text}

Input Text
    [Documentation]    Input text into target element
    ...                ${locator}    - Locator of target element
    [Arguments]    ${locator}    ${text}
    app_common_keywords.Wait Element Is Visible    ${locator}
    AppiumLibrary.Input Text    ${locator}    ${text}

Click Element
    [Documentation]    Click to target element
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for target element visible
    [Arguments]    ${locator}    ${timeout}=${APPGLOBALTIMEOUT}
    AppiumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    AppiumLibrary.Click Element    ${locator}

Verify Elements Are Visible
    [Documentation]    This keyword verify that page contains elements specified in arguments and verify each element is visible
    ...    ${elems}    - Varargs of locators or elements
    [Arguments]    @{elems}
    FOR    ${elem}    IN    @{elems}
        AppiumLibrary.Wait Until Page Contains Element    ${elem}    timeout=${APPGLOBALTIMEOUT}
    END  

Wait Element Is Visible
    [Documentation]    Wait element is visible
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for target element visible
    [Arguments]    ${locator}    ${timeout}=${APPGLOBALTIMEOUT}
    AppiumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}

Wait Until Element Is Not Visible
    [Documentation]    Wait element is not visible
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for current page does not contain target element
    [Arguments]    ${locator}    ${timeout}=${APPGLOBALTIMEOUT}
    AppiumLibrary.Wait Until Page Does Not Contain Element    ${locator}    timeout=${timeout}

Click search button on virtual keyboard
    AppiumLibrary.Press Keycode    66