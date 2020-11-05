class Form::AdvicediaryCollection < Form::Base
  DEFAULT_ITEM_COUNT = 4
  attr_accessor :advicediaries

  def initialize(attributes = {})
    super attributes
    self.advicediaries = DEFAULT_ITEM_COUNT.times.map { Form::Advicediary.new } unless advicediaries.present?
  end

  def advicediaries_attributes=(attributes)
    self.advicediaries = attributes.map { |_, v| Advicediary.new(v) }
  end

  def save
    Advicediary.transaction do
      self.advicediaries.map(&:save!)
    end
      return true
    rescue => e
      return false
  end

end