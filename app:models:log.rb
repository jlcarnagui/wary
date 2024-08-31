# app/models/log.rb
class Log < ApplicationRecord
  belongs_to :employee

  validates :dni_or_license_plate, :entry_type, :timestamp, :client, presence: true
end