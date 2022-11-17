class Paper < ApplicationRecord
    has_many :questions, dependent: :destroy
    validates :subject, presence: true
end
