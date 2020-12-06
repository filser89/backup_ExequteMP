class Booking < ApplicationRecord
  monetize :price_cents
  belongs_to :user
  belongs_to :training_session

  def standard_hash
    {
      id: id,
      name: user.name,
      date: training_session.begins_at,
      training_session_id: training_session.id,
      training: training_session.localize_name,
      booked_with: booked_with
    }
  end

  def cancelled_on_time?
    ((training_session.begins_at - cancelled_at) * 24).to_i > training_session.cancel_before
  end
end
