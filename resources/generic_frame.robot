*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${browser}    chrome
${executeable_path}    ./chromedriver.exe

*** Keywords ***
Open Browser And Maximize
    [Arguments]    ${url}
    Open Browser  ${url}  ${browser}   ${executeable_path}
    Maximize Browser Window
    Sleep    2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed