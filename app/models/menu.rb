class Menu < ActiveRecord::Base
  validates :category, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end