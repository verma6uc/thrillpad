class Booking < ActiveRecord::Base
  attr_accessible :activity_id, :amount_status, :date, :end_time, :id, :is_confirmed, :start_time, :user_id
  belongs_to :activity
  belongs_to :user
end
