class Bill < ActiveRecord::Base
  belongs_to :issue

  before_save :send_bill_amount


 def send_bill_amount
 	user_total = self.total
 	issue = self.issue_id
 # 	 engineer = self.user_id
 # 	 issue = self.issue_id
 	 assign_issue = Issue.find(issue)
 	 assign_issue.total_amount = user_total
 	 assign_issue.save!
 end

end
