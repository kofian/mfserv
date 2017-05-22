class Mailer

#  def self.send_replacement_request(shift)
#   @recipients = ...
#        @recipients.each do |recipient|
#       request_replacement(recipient, shift).deliver
#     end
#   end

# def request_replacement(shift)
#  @shift = shift
#  @user = shift.user
#  @recipients = User.where(:replacement_emails => true)
#  @url  = root_url
#  emails = @recipients.collect(&:email).join(",")
#  mail(:to => emails, :subject => "A replacement clerk has been requested")
# end
end
