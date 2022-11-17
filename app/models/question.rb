class Question < ApplicationRecord
    belongs_to :paper
    validates :title, presence: true
    has_many :multiple_choices, dependent: :destroy
    accepts_nested_attributes_for :multiple_choices
    validates_associated :multiple_choices
end
