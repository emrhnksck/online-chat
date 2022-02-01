class Room < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_rooms, -> {where(is_private: false)}
  after_create_commit { broadcast_append_to 'rooms' }
  after_initialize do
  if self.new_record?
    self.is_private = false
  end
end

end
