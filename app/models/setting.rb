class Setting < ActiveRecord::Base

  def date_scheme?
    code_scheme == 0
  end

  def self.active
    Setting.first || Setting.create(code_scheme: 0)
  end

  def self.date_scheme?
    active.date_scheme?
  end
end
