class Users::Mailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
  def confirmation_instructions(record, token, opts={})
    #record内にユーザ情報が入っていました。そこの"unconfirmed_email"の有無で登録／変更を仕分けます
    #opts属性を上書きすることで、Subjectやfromなどのヘッダー情報を変更することが可能！
    if record.unconfirmed_email != nil
      opts[:subject] = "Toreka | メールアドレス変更手続きのお知らせ"
    else
      opts[:subject] = "Toreka | 本登録用URLのお知らせ"
    end
    #件名の指定以外は親を継承
    super
  end
end