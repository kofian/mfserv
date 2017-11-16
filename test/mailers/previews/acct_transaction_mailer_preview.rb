# Preview all emails at http://localhost:3000/rails/mailers/acct_transaction_mailer
class AcctTransactionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/acct_transaction_mailer/secure_tac
  def secure_tac
    AcctTransactionMailer.secure_tac
  end

end
