*** Settings ***
Documentation    Test Cases for the triangle type checker
Resource    ../../resources/triangle_page.robot
Resource    ../../resources/generic_frame.robot
Test Setup  Open Browser And Maximize    ${url}
Test Teardown  Close Browser Window


*** Test Cases ***
Test Specify Equilateral Triangle
    # Arrange
    Specify Triangle Dimensions    Equilateral
    # Act
    ${tr_type}    Identify Triangle Type
    # Assert
    Should Be Equal As Strings  ${tr_type}    Equilateral

Test Specify Scalene Triangle
    # Arrange
    Specify Triangle Dimensions    Scalene
    # Act
    ${tr_type}    Identify Triangle Type
    # Assert
    Should Be Equal As Strings  ${tr_type}    Scalene

Test Specify Isosceles Triangle
    # Arrange
    Specify Triangle Dimensions    Isosceles
    # Act
    ${tr_type}    Identify Triangle Type
    # Assert
    Should Be Equal As Strings  ${tr_type}    Isosceles

Test Specify Not A Triangle
    # Arrange
    Specify Triangle Dimensions    ${None}
    # Act
    ${tr_type}    Identify Triangle Type
    # Assert
    Should Be Equal As Strings  ${tr_type}    Error: Not a Triangle