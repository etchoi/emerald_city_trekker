class Requested < ActiveRecord::Base
  belongs_to :user
  belongs_to :tour
  belongs_to :provider
end
