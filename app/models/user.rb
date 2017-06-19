class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_secure_password
  has_many :time_entries
end
