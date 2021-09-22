*** Setting ***
Resource    ${CURDIR}/../keywords/web/web_resources_import.robot

Resource    ${CURDIR}/../keywords/api/suggestion_api.robot

Suite Teardown    Close All Browsers

Library         DataDriver          ../Test_Data/TC02/TC02_data.csv       encoding=utf_8

Test Setup           common_keywords.Open browser to page            ${base_url}
Test Teardown        Close Browser

Test Template        TC02: Search Product and Verify Invalid Result

*** Test Cases ***
TC02: Search Product and Verify Invalid Result       ${search_text}          ${expected_suggestion}          ${search_string}

*** Keywords ***
TC02: Search Product and Verify Invalid Result
    [Arguments]                                     ${search_text}           ${search_string}
    home_page.Search Product in Home Page           ${search_text}

    home_page.Verify Suggestion Field is not Visible for Invalid searchKey

    ${response}=                        suggestion_api.Call API get Suggestion List                    ${search_string}
    suggestion_api.Verify API get Suggestion Does Not Contain Invalid Search Key                       ${response.text}