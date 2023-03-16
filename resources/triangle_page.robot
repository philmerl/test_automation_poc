*** Settings ***
Documentation    Ein beispielhaftes Page Object
Library    SeleniumLibrary
Library    Collections
Library    ../libraries/SyTeDa.py


*** Variables ***
${url}    https://testpages.herokuapp.com/styled/apps/triangle/triangle001.html

# Locators of page elements
${side_one}       id:side1
${side_two}       id:side2
${side_three}     id:side3
${identify_type}  id:identify-triangle-action
${triangle_type}  id:triangle-type


*** Keywords ***
Specify Triangle Dimensions
    [Arguments]    ${tr_type}
    &{data}    generate triangle    ${tr_type}
    ${s_one}    get from dictionary    ${data}    a
    Input Text    ${side_one}      ${s_one}
    ${s_two}    get from dictionary    ${data}    b
    Input text    ${side_two}      ${s_two}
    ${s_three}    get from dictionary    ${data}    c
    Input text    ${side_three}    ${s_three}

Identify Triangle Type
    Click Button    ${identify_type}
    wait until element is visible    ${triangle_type}
    ${res}    Get Text    ${triangle_type}
    [Return]    ${res}