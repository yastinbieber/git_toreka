class TargetMailer < ApplicationMailer
	default from: 'toreka.bodymake@gmail.com'

  def input_information(idealweight)
    @idealweight = idealweight
    mail(subject: "Toreka | 目標を登録しました" ,to: @idealweight.user.email)
  end
  
  def edit_information(idealweight)
  	@idealweight = idealweight
  	mail(subject: "Toreka | 目標を変更しました" ,to: @idealweight.user.email)
  end
  
end
