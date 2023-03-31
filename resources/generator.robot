*** Settings ***
Documentation   Gen
Library    RPA.Excel.Files
Library    RPA.Assistant
Library    RPA.FileSystem
Library    BuiltIn
# Library    FakerLibrary
Library    ../libraries/ExcelEtl.py
Library    ../libraries/SyTeDa.py


*** Keywords ***
Create Input Form
    Add Heading     SyTeDa Generator-Assistent
    ${files}=    Find files    ../gen-src/schemas/*.yaml

    file_type=*.xlsx;*.xls;*.yml;*.yaml;

    &{response}     Run Dialog
    Log             ${response}[schema_file]

Beispiel
    Add heading     Select user type
    Add drop-down
    ...    name=user_type
    ...    options=Admin,Maintainer,Operator
    ...    default=Operator
    ...    label=User type
    ${result}=      Run dialog
    Log    User type should be: ${result.user_type}

*** Tasks ***
Generate Test Data Into Excel
    # Create Input Form
    Beispiel
    ${res} =    Generate Test Data From Scratch    200
    create excel workbook from table   ./test.xlsx   ${res}