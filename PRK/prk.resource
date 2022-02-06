*** Settings ***
Documentation     Template keyword resource.
Library           RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.Tables
Library    RPA.Excel.Files
Library    RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${NEW_DIR_1}=     new-dir-1
${NEW_DIR_2}=     new-dir-2
${NEW_DIR_2_COPY}=    copy-of-new-dir-2
${TEXT_FILE}=     file.txt
${TEXT_FILE_COPY}=    copy-of-file.txt
${EXCEL_FILE}   Employees.xlsx
${USERNAME}  fillmein@gmail.com
${PASSWORD}  fdsfdsfdf
${RECIPIENT_ADDRESS}      fillmein@gmail.com

# +
*** Keywords ***
Open the PRK website
    Open Available Browser    https://robotsparebinindustries.com/

Log into PRK
    Input Text    username    maria
    Input Password    password    thoushallnotpass
    Submit Form

Read the excel new ansatte report
    Open workbook  ${EXCEL_FILE}
    ${worksheet}=  Read worksheet
    ${orders}=  Create table     ${worksheet}
    ${rows}  ${columns}=    Get table dimensions    ${orders}
    Log    Table has ${rows} rows and ${columns} columns.
    [Return]         ${orders}
    [Teardown]       Close workbook

Sending test email
    Authorize SMTP    ${USERNAME}   ${PASSWORD}  smtp.gmail.com  587
    Send Message  sender=${USERNAME}
    ...           recipients=${RECIPIENT_ADDRESS}
    ...           subject=Message from RPA Robot
    ...           body=RPA Robot message body
    
Open the user in PRK

Download the excel new ansatte report
    Input Text    locator    text
    
Give user access to the system

Send email to the leader
