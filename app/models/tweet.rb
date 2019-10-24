class Tweet < ApplicationRecord
    validates :description, presence: true
    validates :user_id, presence: true
    
    belongs_to :user
    
    scope :recent, -> { order(created_at: :desc) }
end
