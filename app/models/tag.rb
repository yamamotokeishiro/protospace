class Tag < ActiveRecord::Base
  validates :name,presence:true,length:{maximum:20}
  has_many :prototype, through: :prototype_tags
  has_many :prototype_tags, dependent: :destroy
end
