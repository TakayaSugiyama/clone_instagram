class PhotoMailer < ApplicationMailer
  def photo_mail(photo)
    @photo = photo 
    mail to: @photo.user.email , subject: "投稿確認メール"
  end
end
