*** Setting ***
Resource    ${CURDIR}/../web/web_resources_import.robot

*** Keywords ***
Call API get Suggestion List
    [Arguments]                     ${search_string}
    ${cartuuid}=                    Get Cookie          cartUuid
    ${jdv}=                         Get Cookie           __jdv
    ${jdc}                          Get Cookie           __jdc
    ${jda}=                         Get Cookie           __jda
    ${jdb}=                         Get Cookie           __jdb


    &{header}=          Create Dictionary
    ...    accept=application/json, text/plain, */*
    ...    accept-encoding=gzip, deflate, br
    ...    accept-language=en,en-US;q=0.9,en-GB;q=0.8,de;q=0.7
    ...    cookie=cartUuid=${cartuuid.value}; __jdv=${jdv.value}; __jdc=${jdc.value}; __jda=${jda.value}; __jdb=${jdb.value}

    ${end_point}=       Set Variable    https://tai-suggest.jd.co.th/?key=${search_string}&terminal=tha_th&callback=_jsonpqbp1e9wv9xr

    ${response}=             RequestsLibrary.GET            url=${end_point}           headers=${header}

    [Return]            ${response}

Verify API get Suggestion Does Not Contain Invalid Search Key
    [Arguments]         ${response}
    Should Not Contain              ${response}        "spuId"


