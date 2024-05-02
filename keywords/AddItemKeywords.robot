*** Settings ***
Library                SeleniumLibrary
Library                OperatingSystem
Resource               ../resources/locator/AddItemTabLocator.robot    
Resource               ../resources/locator/ToDoTaskTabLocator.robot   

*** Keywords ***
QA go to website 
    [Documentation]                 open brower : visit web site a while
    [Arguments]                     ${Website}
    SeleniumLibrary.Open Browser    https://abhigyank.github.io/To-Do-List/    chrome
    Maximize Browser Window
    Page Should Contain    Add Item     # If already check that have is an additional item bar.
    Sleep    1s  

Write list plan for notice thing to do
    [Documentation]                 create task : name 'write test cases'
    [Arguments]                     ${Write_plan}
    SeleniumLibrary.Click Element   ${additem_tab}
    SeleniumLibrary.Input Text      ${additem_filed}   Write a Task
    Sleep    2s
    
Save a Plan
    [Documentation]                 save : save plan for todo
    [Arguments]                     ${Save}
    SeleniumLibrary.Click Element   ${additem_button}
    Sleep    2s

Show Result of Test Case
    [Documentation]                 just show data 
    #[Arguments]                     ${expect_resulf}
    SeleniumLibrary.Click Element   ${todotask_tab}
    Sleep    1s

Return to add task page for testing new create again
    [Documentation]                 back todo
    SeleniumLibrary.Click Element    ${additem_tab}
    Sleep    1s

Create 1 task 
        And Write list plan for notice thing to do    Write_plan
        Then Save a Plan    Save
        And Show Result of Test Case 
        Sleep    2s 

Create many task
    #When User Go To Web site    $website
    FOR    ${counter}    IN RANGE    3
        Write list plan for notice thing to do    Write_plan
        Then Save a Plan    Save
        Log    ${counter}
        And Show Result of Test Case    
        Sleep    2s
    END