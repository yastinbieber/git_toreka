class PurposeMailer < ApplicationMailer
	default from: 'toreka.bodymake@gmail.com'

  def input_information(useradvice)
    @useradvice = useradvice
    mail(subject: "Toreka | 目標を登録しました" ,to: @useradvice.user.email)
  end
  
  def edit_information(useradvice)
  	@useradvice = useradvice
  	mail(subject: "Toreka | 目標を変更しました" ,to: @useradvice.user.email)
  end
end
