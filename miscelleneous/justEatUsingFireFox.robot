*** Settings ***
Library        OperatingSystem
Library        ../util/commonCallsFireFox.py
Library        SeleniumLibrary
Library        ../util/Open_Url_Firefox.py

Resource       ../pageObject/locator.robot
# Library         Screenshot
Library        Selenium2Library  timeout=10   implicit_wait=1.5   run_on_failure=Capture Page Screenshot FailedImages/requestElement.png

*** Variables ***

${postcode}

*** Keywords ***
Home Of Just Eat Is Open
   ${url}=    Get File    urlEnv.txt
   Test Open Url    ${url}

Postal Code Is Inserted
    [arguments]  ${postcode}
    ${enter_postalCode}=    Enter PostalCode  ${postcode}

The Error Message Result Should Be Shown
    ${postalcode_ErrorMsg}=    Postalcode  ErrorMsg
    Wait Until Element Is Visible    ${postalcode_ErrorMsg}
    Should be equal as strings  ${postalcode_Errormsg}  ${HOME-PAGE-ERRORMSGB LOCATOR}

Total number of Resturants Should Be Shown
    [arguments]  ${postcode}
    ${filtered_resturants}=   Filtered Resturants
    Should be equal as strings  ${filtered_resturants[0]}  ${postcode}      ignore_case=True
    should contain any  ${filtered_resturants[1]}  No  open  restaurants      ignore_case=True


*** Test Cases ***
Verify Just Eat Title
    Given Home Of Just Eat Is Open
    Display Title  ${HOME-PAGE-TITLE LOCATOR}

Verify Just Eat Content Titles
    Given Home Of Just Eat Is Open
    ${contentTitles}=   Find ContentTitles   title   subtitle
    Should be equal as strings  ${contentTitles[0]}  ${HOME-PAGE-CONTENT-TITLE LOCATOR}
    Should be equal as strings  ${contentTitles[1]}  ${HOME-PAGE-CONTENT-SUBTITLE LOCATOR}

Verify Just Eat Search Attributes
    Given Home Of Just Eat Is Open
    ${findSearch}=   Find Search
    Should be equal as strings  ${findSearch[0]}  ${HOME-PAGE-NAME LOCATOR}
    Should be equal as strings  ${findSearch[1]}  ${HOME-PAGE-LABEL LOCATOR}
    Should be equal as strings  ${findSearch[2]}  ${HOME-PAGE-BUTTON LOCATOR}

Verify Just Eat Total Number of Resturants When Postal Code is valid
    Given Home Of Just Eat Is Open
    ${postcode}=   Set Variable  AR511AA
    When Postal Code Is Inserted   ${postcode}
    Then Total number of Resturants Should Be Shown   ${postcode}

Verify Just Eat Total Number of Resturants When Postal Code is Unknown
    Given Home Of Just Eat Is Open
    ${postcode}=   Set Variable  ZZ511ZZ
    When Postal Code Is Inserted   ${postcode}
    Then Total number of Resturants Should Be Shown   ${postcode}

Verify Just Eat No Resturants found When Post Code is invalid
    Given Home Of Just Eat Is Open
    ${postcode}=  Set Variable  AR51
    When Postal Code Is Inserted   ${postcode}
    Then The Error Message Result Should Be Shown


Verify Just Eat Search Error Message When Postal Code is null
    Given Home Of Just Eat Is Open
    ${postcode}=   Set Variable   "''"
    When Postal Code Is Inserted   ${postcode}
    Then The Error Message Result Should Be Shown

        [Teardown]   Destroy Browser


