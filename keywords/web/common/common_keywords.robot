*** Settings ***
Resource    ${CURDIR}/../web_resources_import.robot

*** Variables ***
${GLOBALTIMEOUT}     ${15}

*** Keywords ***
Open browser to page
    [Arguments]    ${url}    ${speed}=0.1 
    ${options}=     Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()     sys
    ${exclude}=    Create Dictionary    "fasp"=True
    ${prefs}=    Create Dictionary    protocol_handler.excluded_schemes=${exclude}
    Call Method     ${options}    add_argument     --disable-infobars
    Call Method     ${options}    add_experimental_option    prefs    ${prefs}
    SeleniumLibrary.Create WebDriver     Chrome      chrome_options=${options}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed     ${speed}
    SeleniumLibrary.Go To     ${url}

Get text and compare value
    [Arguments]    ${locator}    ${text_value}
    ${text}    Get Text Element    ${locator}
    BuiltIn.Return From Keyword If
    ...    '${text}' == '${text_value}'    ${true}

Get text and search value
    [Arguments]    ${locator}    ${text_value}
    ${text}    Get Text Element    ${locator}
    ${status}    BuiltIn.Run Keyword And Return Status
    ...    BuiltIn.Should Contain    ${text}    ${text_value}
    BuiltIn.Return From Keyword     ${status}

Input data and verify text for web element
    [Arguments]     ${locator}      ${expect_text}
    SeleniumLibrary.Input Text     ${locator}    ${expect_text}
    ${real_text}=    SeleniumLibrary.Get Value    ${locator}
    Should Be Equal    '${real_text}'    '${expect_text}'      

Verify Web Element Is Visible
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    timeout=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${GLOBALTIMEOUT}

Verify Web Element Is Not Visible
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Page Does Not Contain Element    ${locator}      timeout=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Not Visible           ${locator}      timeout=${GLOBALTIMEOUT}

Click Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    SeleniumLibrary.Click Element  ${locator}

Get Text Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    ${text}    SeleniumLibrary.Get Text  ${locator}
    BuiltIn.Return From Keyword    ${text}

Select Checkbox Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    SeleniumLibrary.Select checkbox  ${locator}

Scroll And Click Element
    [Arguments]    ${locator}
    Scroll To Element    ${locator}
    common_keywords.Click Element    ${locator}

Scroll To Element
    [Arguments]    ${locator}
    SeleniumLibrary.Scroll Element Into View    ${locator}

Select from drop down by label
    [Arguments]     ${locator}     ${label}
    common_keywords.Verify Web Element Is Visible   ${locator}
    Wait Until Keyword Succeeds    3x    5s    SeleniumLibrary.Select From List By Label   ${locator}    ${label}  
