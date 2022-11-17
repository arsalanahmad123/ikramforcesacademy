class MultipleChoice < ApplicationRecord
    belongs_to :question
    validates :ans1, presence: true
    validates :ans2, presence: true
    validates :ans3, presence: true
    validates :ans4, presence: true
end
