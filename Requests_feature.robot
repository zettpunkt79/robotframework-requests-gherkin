*** Settings ***
Default tags    Requests_feature
Resource        Requests_steps.robot

*** Comments ****
Further request examples can be found here:
https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot

*** Test Cases ***
Scenario: I can send a get request
    [Tags]    get
    I send a GET request to the base URL
    Then the repsonse code equals "200"

Scenario: I can send a get request with URL parameters
    [Tags]    get
    I send a GET request with URL parameters
    Then the repsonse code equals "200"
    Then the repsonse body contains the parameters

Scneario: I can send a get request with authentication
    [Tags]    get
    I send a GET request with authentication
    I am authenticated