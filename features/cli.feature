Feature: Command line interpreter

  You can use Colorant from the command line as well.

  Scenario: get the most relevant colors out of the Arnolfini Portrait
    When I run "colorant arnolfini.jpg --colors 8 --depth 24"

    Then the output should match /\tBrown\t\t\t\t\t\t-- 40.54 %/
    And the output should match /\Red\t\t\t\t\t\t-- 17.88 %/
    And the output should match /\tBrown\t\t\t\t\t\t-- 12.76 %/
    And the output should match /\tRed\t\t\t\t\t\t-- 9.95 %/
    And the output should match /\tBrown\t\t\t\t\t\t-- 8.03 %/
    And the output should match /\tBrown\t\t\t\t\t\t-- 4.25 %/
    And the output should match /\tRed\t\t\t\t\t\t-- 3.55 %/
    And the output should match /\tBrown\t\t\t\t\t\t-- 3.03 %/
    And the exit status should be 0
    
  Scenario: get an extended report over the Arnolfini Portrait
    When I run "colorant arnolfini.jpg --extended"

    Then the output should match /\tCocoa Brown\t\t\t\t\t\t-- 40.54 %/
    And the output should match /\tMoccaccino Red\t\t\t\t\t\t-- 17.88 %/
    And the output should match /\tRock Brown\t\t\t\t\t\t-- 12.76 %/
    And the output should match /\tMojo Red\t\t\t\t\t\t-- 9.95 %/
    And the output should match /\tBrown Derby\t\t\t\t\t\t-- 8.03 %/
    And the output should match /\tDark Tan Brown\t\t\t\t\t\t-- 4.25 %/
    And the output should match /\tBrandy Rose Red\t\t\t\t\t\t-- 3.55 %/
    And the output should match /\tVanilla Brown\t\t\t\t\t\t-- 3.03 %/
    And the exit status should be 0
