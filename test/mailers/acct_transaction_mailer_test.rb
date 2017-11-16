require 'test_helper'

class AcctTransactionMailerTest < ActionMailer::TestCase
  test "secure_tac" do
    mail = AcctTransactionMailer.secure_tac
    assert_equal "Secure tac", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
