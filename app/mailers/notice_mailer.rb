class NoticeMailer < ApplicationMailer
	default from: 'toreka.bodymake@gmail.com'

  def check_lastday(idealweight)
  	Idealweight.where("last_day" == Date.current).each do |idealweight|
	    @idealweight = idealweight
	    NoticeMailer.check_lastday(idealweight).deliver_now
	    mail(subject: "Toreka | Bodymake最終日となりました・・・" ,to: @idealweight.user.email)
    end
  end
  
end
