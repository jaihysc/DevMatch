module UserHelper
  def job_title_icon
    job_title = @user.profile.job_title
    if job_title == "Developer"
      "<i class='fas fa-code'></i>".html_safe #Be sure to always sanitise string injection
    elsif job_title == "Entrepreneur"
      "<i class='fas fa-lightbulb'></i>".html_safe
    elsif job_title == "Investor"
      "<i class='fas fa-wallet'></i>".html_safe
     end
  end
end