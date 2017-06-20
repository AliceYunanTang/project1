class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :time_entries

  # def update_balance!
  #   update_attributes(
  #     balance: self.time_entries.sum(:amount)
  #   ) unless self.time_entries.nil?
  # end
end
