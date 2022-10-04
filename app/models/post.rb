class Post < ApplicationRecord
  belongs_to :user
  validates :load_date, :load_c, :unload_c, :truck_type, :load_city, :unload_city, :load_address, :unload_address, :weight, :length, presence: true
  validate :load_date_cannot_be_in_the_past, on: :create
  scope :filter_by_load_c, -> (load_c) { where load_c: load_c }
  scope :filter_by_unload_c, -> (unload_c) { where unload_c: unload_c }
  scope :filter_by_truck_type, -> (truck_type) { where("'#{truck_type}' = ANY (truck_type)") }
  scope :filter_by_load_date, -> (load_date) { where load_date: load_date.to_date }

  def load_date_cannot_be_in_the_past
    if load_date.present? && load_date < Date.today
      errors.add(:load_date, "can't be in the past")
    end
  end

  def hours_ago
    h_ago = (Time.now - self.created_at) / 3600
    if h_ago < 1
      "#{(h_ago * 60).round} minutes ago"
    elsif h_ago > 24
      "#{(h_ago / 24).round} days ago"
    else
      "#{h_ago.round} hours ago"
    end
  end

  def reference
    "#{self.id.to_s.last}#{self.user.id.to_s.last}#{self.load_c.first(2)}#{self.unload_c.first(2)}#{Date.today.strftime('%d')}"
  end
end
