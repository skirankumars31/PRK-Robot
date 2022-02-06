*** Settings ***
Documentation     Give access to users
Resource          prk.resource

*** Tasks ***
Give access to users
    Open the PRK website
    Log into PRK
    Download the excel new ansatte report
    Read the excel new ansatte report
    Give user access to the system
    Send email to the leader
