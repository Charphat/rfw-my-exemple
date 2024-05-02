*** Settings ***
Library                SeleniumLibrary
Library                Collections
Resource               ../resources/locator/ToDoTaskTabLocator.robot



*** Keywords ***
Go on to do tasks, can see all task lists 
    #[Arguments]                      ${My_Task}
    Click Element                    ${Todotask_Tab}    
    Get Element Attribute            ${Todotask_Tab}     To-Do Tasks
    #Log                              ${My_Task}
    Sleep    1s 

Click checkbox for mark complete that task for test
    [Arguments]                      ${Complete} 
    Click Element                    ${Todotask_Tab}
    SeleniumLibrary.Click Element    ${Checkbox}
    Sleep    1s  

Summay task before in to next test case
    [Arguments]                      ${Summary_Task}
    Click Element                    ${Todotask_Tab}
    ${Task_before}    SeleniumLibrary.Get Element Count   //*[@id="incomplete-tasks"]/li
    Log                              ${Task_before}     # พิมพ์จำนวน element ที่นับได้
    Set Suite Variable               ${Task_before}       # เก็บค่าจำนวน element ไว้ในตัวแปรของ Test Suite
    Sleep    1s 

Summay task after test case done and compare
    [Arguments]                      ${Last_Total}
    Click Element                    ${Todotask_Tab}
    ${Task_After}    SeleniumLibrary.Get Element Count    //*[@id="incomplete-tasks"]/li
    Log                              ${Task_After}       # พิมพ์จำนวน element ที่นับได้
    Set Suite Variable               ${Task_After}        # เก็บค่าจำนวน element ไว้ในตัวแปรของ Test Suite
    Sleep    2s 

Compare Task Count Before And After
    [Documentation]                 example test case using stored element count
    [Arguments]                     ${Total_Task}
    ${Task_After} =    Convert To Number    ${Task_After}
    Should Not Be Equal   ${Task_After}     ${Task_before}

Click for delete Task
    [Documentation]                 action delete task , 1 click 
    [Arguments]                     ${Delete}
    SeleniumLibrary.Click Element   ${Delete_Button} 
    Sleep    1s 

Delete all task lists in to do Task_before
    [Documentation]                for delete all task 
    When Summay task before in to next test case            Summary_Task 
        FOR    ${index}    IN RANGE    1    9999
        And Click for delete Task                           Delete_Button                       
            Element Should Be Visible                       //*[@id="incomplete-tasks"]/li[1]/button
            Sleep    1s
            SeleniumLibrary.Click Element                   ${Delete_Button}
            Sleep    1s
            Log    Delete All list task
            Log    No task stop and continue other test
            Wait Until Page Does Not Contain Element        Delete_Button
            Exit For Loop
            Summay task after test case done and compare    Last_Total
            Compare Task Count Before And After             Total_Task
    END

Will not show error 'cause test case it 'PASS'
    Log    Test Case Not Have Error 