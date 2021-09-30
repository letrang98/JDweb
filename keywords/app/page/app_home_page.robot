*** Settings ***
Resource    ${CURDIR}/../locator/app_home_page_locator.robot

*** Keywords ***
Search product with keyword
    [Arguments]    ${keyword}
    Click search box button
    Input keyword to search box     ${keyword}
    app_common_keywords.Click search button on virtual keyboard

Click search box button
    app_common_keywords.Click Element    ${dictHomePageApp}[btn_search]

Input keyword to search box
    [Arguments]    ${keyword}
    app_common_keywords.Verify Elements Are Visible    ${dictHomePageApp}[txt_search_after_click]
    Run Keyword And Ignore Error    AppiumLibrary.Clear Text    ${dictHomePageApp}[txt_search_after_click]
    AppiumLibrary.Input Text    ${dictHomePageApp}[txt_search_after_click]    ${keyword}