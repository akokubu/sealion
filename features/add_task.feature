Feature: User can enter a new task
  In order to keep the things to do
  I want to be able to create a new task.

  Scenario: A task is entered with title and description
    When I have opened "new_task_path" page
    And I fill in "Title" with "Do gardening"
    And I fill in "Description" with "give the water to the plant"
    And I press "Create Task"
    Then I should see "Listing tasks"
    And I should see "Task was successfully created."
    And I should see "Do gardening"
