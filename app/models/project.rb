# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#  location    :string
#  balance     :decimal(, )
#

class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :time_entries

  # def update_balance!
  #   update_attributes(
  #     balance: self.time_entries.sum(:amount)
  #   ) unless self.time_entries.nil?
  # end
end
