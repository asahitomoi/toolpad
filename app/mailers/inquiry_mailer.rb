class InquiryMailer < ActionMailer::Base
  default from: "toolpad123@gmail.com"   # 送信元アドレス
  default to: "toolpad123@gmail.com"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end

end