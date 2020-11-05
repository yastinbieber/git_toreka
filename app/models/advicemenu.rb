class Advicemenu < ApplicationRecord
	has_many :advicediaries
  
  def self.search(search) 
    if search
      Advicemenu.where(['menu LIKE ?', "%#{search}%"])
    else
      Advicemenu.all
    end
  end
end
