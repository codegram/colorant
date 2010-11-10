Feature: Command line interpreter

  You can use Colorist from the command line as well as a ruby gem.

  Scenario: get the most relevant colors out of the Arnolfini Portrait
    When I run "colorist arnolfini.jpg --colors 8 --depth 24"

    Then the exit status should be 0
    And the output should contain "Brown		-- 40.54 %"
    And the output should contain "Red		-- 17.88 %"
    And the output should contain "Brown		-- 12.76 %"
    And the output should contain "Red		-- 9.95 %"
    And the output should contain "Brown		-- 8.03 %"
    And the output should contain "Brown		-- 4.25 %"
    And the output should contain "Red		-- 3.55 %"
    And the output should contain "Brown		-- 3.03 %"
    
  Scenario: get an extended report over the Arnolfini Portrait
    When I run "colorist arnolfini.jpg --extended"

    Then the exit status should be 0
    And the output should contain "Cocoa Brown		-- 40.54 %"
    And the output should contain "Moccaccino Red		-- 17.88 %"
    And the output should contain "Rock Brown		-- 12.76 %"
    And the output should contain "Mojo Red		-- 9.95 %"
    And the output should contain "Brown Derby		-- 8.03 %"
    And the output should contain "Dark Tan Brown		-- 4.25 %"
    And the output should contain "Brandy Rose Red		-- 3.55 %"
    And the output should contain "Vanilla Brown		-- 3.03 %"
    
