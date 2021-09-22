*** Setting ***
Resource    ${CURDIR}/../web_resources_import.robot
Resource    ${CURDIR}/../locator/home_page.robot

***Keyword***
Search Product in Home Page
    [Arguments]                         ${search_text}
    Close Ad in Home Page
    Verify Home Page is loaded
    Input Search Text                   ${search_text}

Close Ad in Home Page
    common_keywords.Click Element                              ${dictHomePage.adCloseButton}

Verify Home Page is loaded
    common_keywords.Verify Web Element Is Visible              ${dictHomePage.headerLogo}

Input Search Text
    [Arguments]            ${search_text}
    common_keywords.Input data and verify text for web element          ${dictHomePage.searchField}         ${search_text}

Verify Suggestion is Visible          
    [Arguments]                                                ${expected_suggestion}
    ${neutral_1}=                                Format String                    ${dictHomePage.suggestion}          suggestion=${expected_suggestion}
    common_keywords.Verify Web Element Is Visible              ${neutral_1}
    
Click Suggestion
    [Arguments]                                                ${expected_suggestion}
    ${neutral_2}=                                Format String                    ${dictHomePage.suggestion}          suggestion=${expected_suggestion}
    common_keywords.Click Element                              ${neutral_2}

Verify Suggestion Field is not Visible for Invalid searchKey
    common_keywords.Verify Web Element Is Not Visible          ${dictHomePage.suggestionField}