class Post < ApplicationRecord
	belongs_to :tag
	has_many :pviews, dependent: :destroy
	validates :title, presence: true
	validates :location, presence: true
	validates :content, presence: true
	validates :banner, presence: true
	validates :video, presence: true
end
