class AcctTransactionMailer < ApplicationMailer
  default from: "tech_support@meijerfinance.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.acct_transaction_mailer.secure_tac.subject
  #
  def secure_tac(tac,email,name)
    @user = name
    @email = email
    @tac = tac
    
    delivery_options = { user_name: "SMTP_KEY",
                         password:  "SMTP_KEY",
                         address: "mail.meijerfinance.com" }

    mail(
      subject: "Your secure transaction code",
      to: @email,
      delivery_method_options: delivery_options
      )
  end
end
