*** Setting ***
Resource    ${CURDIR}/../web/web_resources_import.robot

*** Keywords ***
Call API get result List
    [Arguments]                     ${search_string}
    ${cartuuid}=                    Get Cookie          cartUuid
    ${jdv}=                         Get Cookie           __jdv
    ${jdc}                          Get Cookie           __jdc
    ${jda}=                         Get Cookie           __jda
    ${jdb}=                         Get Cookie           __jdb
    ${lan}=                         Get Cookie          language


    &{header}=          Create Dictionary
    ...    accept=application/json, text/plain, */*
    ...    accept-encoding=gzip, deflate, br
    ...    accept-language=en,en-US;q=0.9,en-GB;q=0.8,de;q=0.7
    ...    cookie=cartUuid=${cartuuid.value}; __jdv=${jdv.value}; __jdc=${jdc.value}; __jda=${jda.value}; __jdb=${jdb.value}; language=${lan.value}

    ${end_point}=       Set Variable    https://api.jd.co.th/client.action?body=%7B%22page%22%3A%221%22%2C%22pagesize%22%3A%2260%22%2C%22cid%22%3A%22%22%2C%22filed%22%3A%22%22%2C%22expandName%22%3A%7B%7D%2C%22brand%22%3A%22%22%2C%22isCorrect%22%3A%221%22%2C%22sort%22%3A%220%22%2C%22stock%22%3A1%2C%22keyword%22%3A%22${search_string}%22%7D&functionId=search&client=pc&clientVersion=2.0.0&lang=th_TH&area=&jsonp=_jsonphb504c8pk99

    ${response}=             RequestsLibrary.GET            url=${end_point}           headers=${header}

    ${list}=                String.Get Regexp Matches              ${response.text}             "spuId":"(.*?)",            1
    
    [Return]                        ${list}
