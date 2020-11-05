class Inquiry < ApplicationRecord
  attr_accessor :nickname, :email, :message

  validates :nickname, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}

end
