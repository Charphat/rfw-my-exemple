*** Settings ***
Library                        SeleniumLibrary



*** Variables ***
${Complete_Tab}              //*[@href="#completed"]
${Check_Icon}                //*[@id="completed-tasks"]/li[1]/span/i
${Delete_Complete}           //*[@id="completed-tasks"]/li/button
${error}                     error