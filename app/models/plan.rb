class Plan < ActiveRecord::Base
  has_many :users #Associates plan with users, that a plan can have many users, the User model subsequently needs to associate back with the Plan
end