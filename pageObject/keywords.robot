*** Settings ***
Library        Selenium2Library
Resource       locator.robot

*** Keywords ***
Start App
  Test Open Url    ${url}
  Open Browser  ${URL}  ${BROWSER}
  Maximize Browser Window
