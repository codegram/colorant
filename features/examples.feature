Feature: Command line interpreter

  You can use Colorist from the command line as well.

  Scenario: get 3 most relevant colors out of the Arnolfini Portrait
    Given a directory named "some_image"

    When I cd to "some_image"
    When I run "colorist -c 8 -d 24 arnolfini.jpg"

    Then the exit status should be 0
    And the output should contain "gtfo"
