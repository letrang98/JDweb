*** Setting ***
Resource    ${CURDIR}/../../resources/imports_resources.robot

#api
Resource    ${CURDIR}/../api/cds/cds_search_api.robot

#common
Resource    ${CURDIR}/common/app_common_keywords.robot

#page
Resource    ${CURDIR}/page/app_home_page.robot
Resource    ${CURDIR}/page/app_product_list_page.robot

#test data
Variables    ${CURDIR}/../../Test_Data/cds/test_data.yaml