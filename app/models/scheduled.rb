class Scheduled < ActiveRecord::Base
  belongs_to :traveler
  belongs_to :provider
end
