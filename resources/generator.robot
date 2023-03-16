*** Settings ***
Documentation   Gen
Library    RPA.Excel.Files
Library    FakerLibrary
Library    ../libraries/ExcelEtl.py
Library    ../libraries/SyTeDa.py

*** Tasks ***
Generate Test Data Into Excel
    ${res} =    Generate Test Data From Scratch    200
    create excel workbook from table   ./test.xlsx   ${res}