*** Settings ***
Library                SeleniumLibrary
Library                OperatingSystem
Resource               ../resources/locator/AddItemTabLocator.robot
Resource               ../keywords/AddItemKeywords.robot
Resource               ../resources/locator/ToDoTaskTabLocator.robot
Resource               ../keywords/ToDoTaskKeyword.robot
Resource               ../keywords/CompleteKeywords.robot
Suite Setup            QA go to website    Website 
Suite Teardown         Close All Browsers

*** Comments ***
This test case will not close Browsers for test *cause i want test like user than more
To compare use total before must be not equal total after is pass

*** Test Cases *** 
Test Case ID : TC001, Create list task for to do thing, Create just 1 task
    Given Create 1 task 
        And Sleep    1s
            Then Create 1 task

- - Test Case ID : TC001-1, Test create list task again but many task
    When Show Result of Test Case
        And Return to add task page for testing new create again
            Then Create many task

Test Case ID : TC002, Click for mark complete task and compare
    Given Go on to do tasks, can see all task lists                    
        Then Summay task before in to next test case                        Summary_Task
            And Click checkbox for mark complete that task for test         Complete
        Then Summay task after test case done and compare                   Last_Total
            And Compare Task Count Before And After                         Total_Task
                But Will not show error 'cause test case it 'PASS'

- - Test Case ID : TC002-1, Click mark complete task by many task and compare
    [Setup]    Create many task
    Given Go on to do tasks, can see all task lists                     
        Then Summay task before in to next test case                        Summary_Task                    
            And Click checkbox for mark complete that task for test         Complete  
            And Click checkbox for mark complete that task for test         Complete
            And Click checkbox for mark complete that task for test         Complete
        Then Summay task after test case done and compare                   Last_Total
            And Compare Task Count Before And After                         Total_Task
                But Will not show error 'cause test case it 'PASS'

- - Test Case ID : TC002-2, Delete task 1 task and compare
    [Setup]    Create many task
    Given Go on to do tasks, can see all task lists                     
        Then Summay task before in to next test case                         Summary_Task
            And Click for delete Task                                        Delete
        Then Summay task after test case done and compare                    Last_Total
            And Compare Task Count Before And After                          Total_Task
                But Will not show error 'cause test case it 'PASS'
- - Test Case ID : TC002-3, Delete task by many task and compare
    [Setup]     Create many task
    Given Go on to do tasks, can see all task lists                     
        Then Summay task before in to next test case                         Summary_Task
            And Click for delete Task                                        Delete
            And Click for delete Task                                        Delete
            And Click for delete Task                                        Delete
        Then Summay task after test case done and compare                    Last_Total              
            And Compare Task Count Before And After                          Total_Task
                But Will not show error 'cause test case it 'PASS'

- - Test Case ID : TC002-4, Delete task until not have task anymore and compare
    Given Go on to do tasks, can see all task lists                                         
            And Delete all task lists in to do Task_before
                But Will not show error 'cause test case it 'PASS'

Test Case ID : TC003, Check data of complete tab
    Given Go on complete tab, can see all task lists
        And Checking, check mark icon on displayed
        Log    Have a Data

- - Test Case ID : TC003-1 Delete task in Completed
    Given Delete task that completed

- - Test Case ID : TC003-2 Click delete many time
    [Setup]     Create many task
                Go on to do tasks, can see all task lists
                Click checkbox for mark complete that task for test         Complete
                Click checkbox for mark complete that task for test         Complete
                Click checkbox for mark complete that task for test         Complete
                Go on complete tab, can see all task lists
    Given Delete task that completed   
        Then Delete task that completed   
        And Delete task that completed    

- - Test Case ID : TC003-3 Check the correctness of the information
    Given Create many task
        Then Go on complete tab, can see all task lists
        And Click checkbox for mark complete that task for test            Complete
        And Click checkbox for mark complete that task for test            Complete
        And Click checkbox for mark complete that task for test            Complete   
            Given Go on complete tab, can see all task lists
            Then Summay Complete task before in to next test case          Summary_Complete_Task 
                Then Delete task that completed
                And Summay Complete task after test case                   Last_Complete_Total   
                And Compare Complete Task Count Before And After           Total_Complete_Task
                Will not show error 'cause test case it 'PASS'  