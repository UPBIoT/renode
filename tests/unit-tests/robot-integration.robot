*** Settings ***
Suite Setup                   Setup
Suite Teardown                Teardown
Test Setup                    Reset Emulation
Resource                      ${CURDIR}/../../src/Renode/RobotFrameworkEngine/renode-keywords.robot

*** Test Cases ***
Should Fail On Loading Nonexisting Script
    ${msg}=     Run Keyword And Expect Error        *   Execute Script      nonexistingscript.resc
    Should Contain      ${msg}      Could not find file

Should Fail On Builtin With Invalid Parameters
    ${msg}=     Run Keyword And Expect Error        *   Execute Command     log invalid_commmand
    Should Contain      ${msg}      Bad parameters for command

Should Fail On Peripheral Method With Invalid Parameters
    ${msg}=     Run Keyword And Expect Error        *   Execute Command     Save invalid_value
    Should Contain      ${msg}      Parameters did not match the signature

Should Fail On Python Command With Invalid Parameters
    ${msg}=     Run Keyword And Expect Error        *   Execute Command     next_value invalid_value
    Should Contain      ${msg}      unsupported operand type

