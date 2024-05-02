*** Settings ***
Library                    SeleniumLibrary



*** Variables ***
${Todotask_Tab}                   //*[@href="#todo"]
${Checkbox}                       //*[@id="incomplete-tasks"]/li[1]/label/span[4]                      
${Delete_Button}                  //*[@id="incomplete-tasks"]/li[1]/button
