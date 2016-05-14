class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider
  belongs_to :tour

  validates :tour_date, presence: { message: "You must specify tour date." }

  validate :tour_date_cannot_be_in_the_past

  def tour_date_cannot_be_in_the_past
   errors.add(:tour_date, "Sorry, can't book a tour for the past -- time travel hasn't been invented (not yet!)") if
     !tour_date.blank? and tour_date < Date.today
  end
end
