Feature: home#index testing

  @javascript @vcr
  Scenario: Page shows weather for random city
    Given I visit home page
    Then I see weather for random city

  @javascript @vcr
  Scenario: When user enters city and select country the weather should be updated
    Given I visit home page
    When I enter "Berlin" into "city" text_field
    And I select "Germany" in "_country" selectbox
    And I submit form
    And I wait "2" seconds
    Then I should see weather for "Berlin" city

  @javascript @vcr
  Scenario: When user enters wrong city and select country warning message is shown
    Given I visit home page
    When I enter "Zaporozhye" into "city" text_field
    And I select "Ukraine" in "_country" selectbox
    And I submit form
    And I wait "2" seconds
    Then Warning message is shown with "Zaporizhzhya" in "UA" suggestion
    And I should see weather for "Zaporizhzhya" city


