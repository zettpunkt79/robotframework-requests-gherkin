*** Settings ***
Library	RequestsLibrary

*** Variables ***
${base_url}    http://httpbin.org

*** Keywords ***
I am authenticated
    Should Be Equal As Strings    ${resp.status_code}                200
    Should Be Equal As Strings    ${resp.json()['authenticated']}    True

I send a GET request to the base URL
    Create Session         session        ${base_url}
    ${resp}=               Get Request    session        /
    Set Global Variable    ${resp}

I send a GET request with URL parameters
    Create Session         session              ${base_url}
    &{params}=             Create Dictionary    key=value      key2=value2
    ${resp}=               Get Request          session        /get           params=${params}
    Set Global Variable    ${params}
    Set Global Variable    ${resp}

I send a GET request with authentication
    ${auth}=               Create List    user           passwd
    Create Session         session        ${base_url}    auth=${auth}
    ${resp}=               Get Request    session        /basic-auth/user/passwd
    Set Global Variable    ${resp}

the repsonse code equals "${status_code}"
    Should Be Equal As Strings    ${resp.status_code}    ${status_code}

the repsonse body contains the parameters
    ${jsondata}=       To Json                ${resp.content}
    Should Be Equal    ${jsondata['args']}    ${params}
