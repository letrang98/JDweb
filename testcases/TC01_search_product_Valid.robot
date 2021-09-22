*** Setting ***
Resource    ${CURDIR}/../keywords/web/web_resources_import.robot

Resource    ${CURDIR}/../keywords/api/search_result_api.robot

Suite Teardown    Close All Browsers

Library         DataDriver          ../Test_Data/TC01/TC01_data.csv       encoding=utf_8

Test Setup           common_keywords.Open browser to page            ${base_url}
Test Teardown        Close Browser

Test Template        TC01: Search Product and Verify Search Result

*** Test Cases ***
TC01: Search Product and Verify Search Result       ${search_text}          ${expected_suggestion}          ${search_string}

*** Keywords ***
TC01: Search Product and Verify Search Result
    [Arguments]                                     ${search_text}          ${expected_suggestion}          ${search_string}
    home_page.Search Product in Home Page           ${search_text}

    home_page.Verify Suggestion is Visible          ${expected_suggestion}
    home_page.Click Suggestion                      ${expected_suggestion}          

    Switch Window                                   NEW

    search_result_page.Verify Search Result page
    
    @{result_list}=                                 search_result_api.Call API get result List              ${search_string}
    FOR     ${item}     IN      @{result_list}
        search_result_page.Verify Search Result Visible      ${item}
    END