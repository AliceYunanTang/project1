# == Schema Information
#
# Table name: time_entries
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  time       :decimal(, )
#  amount     :decimal(, )
#  end_time   :datetime
#  start_time :datetime
#

class TimeEntry < ApplicationRecord


  belongs_to :user, optional: true
  belongs_to :project, optional: true

  before_create :calculate_amount!
  before_create :calculate_time!
  # after_save :update_project_balance!

  # def entry_date_formatted
  #   self.entry_date.strftime '%d.%m.%Y' unless self.entry_date.nil?
  # end
  #
  # def entry_date_formatted=(value)
  #   return if value.nil? or value.blank?
  #   self.entry_date = DateTime.strptime(value, '%d.%m.%Y').to_date
  # end

  def self.per_hour
    50
  end

  def calculate_time!
    self.time = (self.end_time.to_i - self.start_time.to_i) / 3600
  end

  def calculate_amount!
    self.amount = TimeEntry.per_hour * self.calculate_time!
  end

  # def update_project_balance!
  #   self.project.update_balance!
  # end

end
