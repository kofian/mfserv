# Preview all emails at http://localhost:3000/rails/mailers/bucket_mailer
class BucketMailerPreview < ActionMailer::Preview
 def upmail_preview
    @recipient = User.pluck(:email)
    mail(
      to: @recipient.email,
      from: "info@transa-transact.com",
      subject: "Update"
    )
 end

end
