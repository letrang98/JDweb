*** Settings ***
Resource    ${CURDIR}/../locator/app_product_list_page_locator.robot

*** Keywords ***
Apply filter with expected filter type
    [Arguments]    ${filter_type}    ${filter_option}
    Click on filter icon
    Select filter type    ${filter_type}
    Select filter option    ${filter_option}
    Click apply filter button
    Wait for loading icon disappear

Click on filter icon
    app_common_keywords.Click Element     ${dictProductListPageApp}[icon_filter]

Select filter type
    [Arguments]    ${filter_type}
    ${locator}    String.Format String    ${dictProductListPageApp}[txt_filter_type]    filter_type=${filter_type}
    app_common_keywords.Click Element    ${locator}

Select filter option
    [Arguments]    ${filter_option}
    ${locator}    String.Format String    ${dictProductListPageApp}[txt_filter_option]    filter_option=${filter_option}
    app_common_keywords.Click Element    ${locator}

Click apply filter button
    app_common_keywords.Click Element    ${dictProductListPageApp}[btn_apply_filter]

Get number of total items
    ${total_skus_str}=    AppiumLibrary.Get Text     ${dictProductListPageApp}[txt_total_items]
    ${total_skus_formatted}    Remove String    ${total_skus_str}    ${SPACE}    items
    ${total_skus}    Convert To Integer    ${total_skus_formatted}
    [Return]    ${total_skus}

Wait for loading icon disappear
    app_common_keywords.Wait Element Is Visible    ${dictProductListPageApp}[icon_gif_loading]
    AppiumLibrary.Wait Until Page Does Not Contain Element    ${dictProductListPageApp}[icon_gif_loading]    timeout=${APPGLOBALTIMEOUT}