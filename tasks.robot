*** Settings ***
Documentation     Insert the sales data for the week and export it as a PDF.
Library           RPA.Browser.Selenium    auto_close=${FALSE}
Resource          prk.resource

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open the intranet website
    Log in

*** Keywords ***
 Log in
    Input Text    username    maria
    Input Password    password    thoushallnotpass
    Submit Form
