*** Settings ***
Default tags    Requests_feature
Resource        Requests_steps.robot

*** Comments ****
Further request examples can be found here:
https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot

*** Test Cases ***
Scenario: I can send a get request
    [Tags]    get
    Given I send a GET request to the base URL
    Then the repsonse code equals "200"

Scenario: I can send a get request with URL parameters
    [Tags]    get
    Given I send a GET request with URL parameters
    Then the repsonse code equals "200"
    And the repsonse body contains the parameters

Scneario: I can send a get request with authentication
    [Tags]    get
    Given I send a GET request with authentication
    Then I am authenticated