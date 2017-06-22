# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  password_digest :string
#  image           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  project_id      :integer
#  email           :string
#  is_admin        :boolean          default(FALSE)
#

class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_secure_password
  has_many :time_entries
end
