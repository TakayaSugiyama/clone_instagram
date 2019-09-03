class PhotoMailer < ApplicationMailer
  def photo_mail(photo)
    @photo = photo 
    mail to: "s.takaya1027@gmail.com", subject: "投稿確認メール"
  end
end
