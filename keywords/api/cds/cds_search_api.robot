*** Variables ***
${api_endpoint}    https://falcon.central.co.th/graphql

*** Keywords ***
Get number of skus return after search product by keyword with filter by delivery option
    [Arguments]    ${keyword}    ${delivery_method}
    ${response}    Search product by keyword with filter by delivery option    ${keyword}    ${delivery_method}
    ${total_skus_arr}    JSONLibrary.Get Value From Json    ${response}    $..totalCount
    ${total_skus_str}    Convert JSON To String    ${total_skus_arr}[0]
    ${total_skus}    Convert To Integer    ${total_skus_str}
    [Return]    ${total_skus}


Search product by keyword with filter by delivery option
    [Arguments]    ${keyword}    ${delivery_method}
    ${keyword}            Set Variable    ${keyword}
    ${delivery_method}     Set Variable    ${delivery_method}
    ${templated_json}=     Get Templated Data From Path    ${CURDIR}/payload/search_with_keyword_and_filter_delivery_method.json    return_type=json
    ${body}=        Evaluate    json.dumps($templated_json)    json
    ${header}=    Create Dictionary    store=en
    ${response}=    REST.Post    endpoint=${api_endpoint}    body=${body}    headers=${header}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]    ${response}