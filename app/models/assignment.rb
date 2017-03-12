class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

 
 before_save :assign_task


 def assign_task
 	 engineer = self.user_id
 	 issue = self.issue_id
 	 assign_issue = Issue.find(issue)
 	 assign_issue.status = "assigned"
 	 assign_issue.save!
 end

end
