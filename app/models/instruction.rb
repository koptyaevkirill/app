class Instruction < ApplicationRecord
	belongs_to :user
  belongs_to :category
	has_many :taggings
	has_many :tags, through: :taggings
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true

  def all_tags
  	self.tags.map(&:name).join(', ')
  end
  def all_tags=(names)
  	self.tags = names.split(',').map do |name|
  		Tag.where(name: name.strip).first_or_create!
  	end
  end
end
