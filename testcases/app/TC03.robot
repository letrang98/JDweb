*** Setting ***
Resource    ${CURDIR}/../../keywords/app/app_resources_import.robot

Test Setup    app_common_keywords.Guest - Open CDS Application And Step To Homepage    ${device_info.trangltt_device}
Test Teardown    app_common_keywords.Close CDS Application

Library    DataDriver    file=../../Test_Data/TC03/TC03_data.xlsx    sheet_name=en_category   encoding=UTF-8    optimize_pabot=Binary
Test Template    Template - Guest search product with filter by delivery option and verify number response product with API

*** Keywords ***
Template - Guest search product with filter by delivery option and verify number response product with API
    [Arguments]    ${filter_type_val}    ${filter_option_val}    ${keyword}
    app_home_page.Search product with keyword    ${keyword}
    app_product_list_page.Apply filter with expected filter type    ${filter_type_val}    ${filter_option_val}
    ${total_sku_UI}    app_product_list_page.Get number of total items
    ${total_sku_API}    cds_search_api.Get number of skus return after search product by keyword with filter by delivery option    ${keyword}    ${filter_option_val}
    Should Be Equal As Integers    ${total_sku_UI}    ${total_sku_API}    msg=Number of sku is displayed incorect, expected: ${total_sku_API} items than in UI: ${total_sku_UI} items

*** Test Cases ***
Verify that total skus return from API and UI is matched when search keyword with delivery option filter
    [Tags]    search_function    guest
    Guest when search with '${keyword_type}'    ${filter_type_val}    ${filter_option_val}    ${keyword}