*** Settings ***
Library                        SeleniumLibrary
Resource                       ../resources/locator/CompleteTabLocator.robot



*** Keywords ***
Go on complete tab, can see all task lists
    [Documentation]
    Click Element    ${Complete_Tab}
    Sleep    1s
    Get Element Attribute    ${Complete_Tab}    Completed
    Sleep    1s

Checking, check mark icon on displayed 
    [Documentation]
        IF     $error == 'True'
            Skip    
            Log    Not have check mark icon, Please fix.
        ELSE IF  $error == 'Fail'
            And Element Should Be Visible    ${Check_Icon}
            Pass Execution    Have Icon
            Log    Check Icon Success
        END

Delete task that completed
    [Documentation]
    SeleniumLibrary.Click Element    ${Delete_Complete}
    Sleep    1s

Summay Complete task before in to next test case
    [Arguments]                      ${Summary_Complete_Task}
    Click Element                    ${Complete_Tab}
    ${Complete_Task_before}     SeleniumLibrary.Get Element Count   //*[@id="completed-tasks"]/li/button
    Log                              ${Complete_Task_before}        # พิมพ์จำนวน element ที่นับได้
    Set Suite Variable               ${Complete_Task_before}        # เก็บค่าจำนวน element ไว้ในตัวแปรของ Test Suite
    Sleep    1s 

Summay Complete task after test case
    [Arguments]                      ${Last_Complete_Total}
    Click Element                    ${Complete_Tab}
    ${Complete_Task_After}    SeleniumLibrary.Get Element Count    //*[@id="completed-tasks"]/li/button
    Log                              ${Complete_Task_After}        # พิมพ์จำนวน element ที่นับได้
    Set Suite Variable               ${Complete_Task_After}        # เก็บค่าจำนวน element ไว้ในตัวแปรของ Test Suite
    Sleep    2s 

Compare Complete Task Count Before And After
    [Documentation]                 example test case using stored element count
    [Arguments]                     ${Total_Complete_Task}
    ${Complete_Task_After} =    Convert To Number              ${Complete_Task_After}
    Should Not Be Equal       ${Complete_Task_before}    ${Complete_Task_After} 
