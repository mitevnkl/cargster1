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
end
