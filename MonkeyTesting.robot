*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           BuiltIn
Library           String
Library           OperatingSystem

Suite Setup       Setup Browser
Suite Teardown    Close Browser

# Code Execution Command : robot -d Results TestCases/MonkeyTesting.robot

*** Variables ***
${URL}            https://sevengramscaffe.com/
${SCROLLING_POINT}    xpath://a[text()='Privacy Policy']
${FOOTER_URL}         xpath://li[@class='Linklist__Item']/a[@class='Link Link--primary']

*** Test Cases ***
Perform Monkey Testing
    [Documentation]    Test case to perform Monkey Testing
    Open Browser And Navigate To URL    ${URL}
    Scroll To Privacy Policy
    Fetch Footer URLs
    Execute Monkey Testing

*** Keywords ***
Setup Browser
    [Documentation]    Start Automation Testing
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Selenium Timeout    10 seconds

Open Browser And Navigate To URL
    [Arguments]    ${url}
    Go To    ${url}

Scroll To Privacy Policy
    [Documentation]    Scroll to the Privacy Policy section
    Wait Until Element Is Visible    ${SCROLLING_POINT}
    Scroll Element Into View    ${SCROLLING_POINT}

Fetch Footer URLs
    [Documentation]    Fetch all footer URLs from the page
    @{footer_elements}=    Get WebElements    ${FOOTER_URL}
    ${footer_count}=    Get Length    ${footer_elements}
    Log    Total Footer Links: ${footer_count}
    ${footer_urls}=    Create List
    FOR    ${element}    IN    @{footer_elements}
        ${href}=    Get Element Attribute    ${element}    href
        Append To List    ${footer_urls}    ${href}
    END
    Set Suite Variable    ${FOOTER_URL_LIST}    ${footer_urls}

Execute Monkey Testing
    [Documentation]    Perform Monkey Testing on all footer URLs
    ${run_count}=    Set Variable    0
    ${random_time}=    Set Variable    0
    FOR    ${url}    IN    @{FOOTER_URL_LIST}
        Go To    ${url}
        ${run_count}=    Evaluate    ${run_count} + 1
        Log    Running the Test: ${run_count} & URL: ${url}
        ${random_time}=    Evaluate    random.randint(0, 2)    modules=random
        Sleep    ${random_time}
        Go Back
    END

Close Browser
    [Documentation]    Close the browser after execution
    Close All Browsers
