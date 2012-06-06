class StackMailer < ActionMailer::Base
  default from: "test.user@rackspace.com"

  def latest_stack_email(email_address)
    @stack_items = StackItem.all(:order => 'created_at DESC')
    mail(:to => email_address, :subject => "Latest stack information")
  end
end
