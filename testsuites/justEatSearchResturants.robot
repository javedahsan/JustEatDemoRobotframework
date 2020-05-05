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

I want food in
    [arguments]  ${postcode}
    ${enter_postalCode}=    Enter PostalCode  ${postcode}

Oops Error Message is shown
    ${postalcode_ErrorMsg}=    Postalcode  ErrorMsg
    Wait Until Element Is Visible    ${postalcode_ErrorMsg}
    Should be equal as strings  ${postalcode_Errormsg}  ${HOME-PAGE-ERRORMSGB LOCATOR}

I should see some restaurants in
    [arguments]  ${postcode}
    ${filtered_resturants}=   Filtered Resturants
    Should be equal as strings  ${filtered_resturants[0]}  ${postcode}      ignore_case=True
    should contain any  ${filtered_resturants[1]}  No  open  restaurants      ignore_case=True

*** Test Cases ***
Feature: Use the website to find restaurants
 So that I can order food
 As a hungry customer
 I want to be able to find restaurants in my area

Scenario: Visit Just Eat and home page should be display
    Given Home Of Just Eat Is Open
    Display Title  ${HOME-PAGE-TITLE LOCATOR}

Scenario: Food Menu should be display
    Given Home Of Just Eat Is Open
    ${contentTitles}=   Find ContentTitles   title   subtitle
    Should be equal as strings  ${contentTitles[0]}  ${HOME-PAGE-CONTENT-TITLE LOCATOR}
    Should be equal as strings  ${contentTitles[1]}  ${HOME-PAGE-CONTENT-SUBTITLE LOCATOR}

Scenario: Search Input should be display
    Given Home Of Just Eat Is Open
    ${findSearch}=   Find Search
    Should be equal as strings  ${findSearch[0]}  ${HOME-PAGE-NAME LOCATOR}
    Should be equal as strings  ${findSearch[1]}  ${HOME-PAGE-LABEL LOCATOR}
    Should be equal as strings  ${findSearch[2]}  ${HOME-PAGE-BUTTON LOCATOR}

Scenario: Search for restaurants in an area with postal code "AR51 1AA"
      Given Home Of Just Eat Is Open
      ${postcode}=   Set Variable  AR511AA
      When I want food in   ${postcode}
      Then I should see some restaurants in     ${postcode}

Scenario: Search for restaurants in a random area "ZZ511ZZ"
      Given Home Of Just Eat Is Open
      ${postcode}=   Set Variable  ZZ511ZZ
      When I want food in   ${postcode}
      Then I should see some restaurants in     ${postcode}

Scenario: I am new in the country, do not about the area and searching for restaurants
      Given Home Of Just Eat Is Open
      ${postcode}=   Set Variable  AR51
      When I want food in   ${postcode}
      Then Oops Error Message is shown

Scenario: I am so hungary and searching for near by restaurants
      Given Home Of Just Eat Is Open
      ${postcode}=   Set Variable  "''"
      When I want food in ${postcode}
      Then Oops Error Message is shown

[Teardown]   Destroy Browser


