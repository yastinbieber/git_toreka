class Form::Advicediary < Advicediary
  REGISTRABLE_ATTRIBUTES = %i(date advicemenu_id weight reps weightsecond repssecond weightthird repsthird memo user_id idealweight_id useradvice_id)
  attr_accessor :advicemenu_id
end

