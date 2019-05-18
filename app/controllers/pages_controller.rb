class PagesController < ApplicationController #Inheriting from application controller - name needs to follow upcase
  def home
    #Finds the corresponding entries in the plans database by id
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
  end
  def about #Name of html page needs to match method - ABOUT.html.erb
  end
end