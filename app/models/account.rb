class Account < ApplicationRecord
    validates :visit_count, presence: true, numericality: true
    validates :loyalty_points, presence: true, numericality: true
    validates :card_number, presence: true, numericality: true
    validates :join_date, presence: true
    validates :last_visit, presence: true
end