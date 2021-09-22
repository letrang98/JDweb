*** Setting ***
Resource    ${CURDIR}/../web_resources_import.robot
Resource    ${CURDIR}/../locator/search_result_page.robot

***Keyword***
Verify Search Result page
    common_keywords.Verify Web Element Is Visible              ${dictSearchResultPage.searchKey}

Verify Search Result Visible
    [Arguments]             ${product_id}
    ${neutral_3}=             Format String                      ${dictSearchResultPage.resultList}           result=${product_id}
    common_keywords.Verify Web Element Is Visible              ${neutral_3}