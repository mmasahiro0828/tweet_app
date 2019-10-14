class Tweet < ApplicationRecord
    validates :description, presence: true
end
