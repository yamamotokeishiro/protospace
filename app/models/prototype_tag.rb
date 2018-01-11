class PrototypeTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :prototype
  validates :prototype_id,presence:true
  validates :tag_id,presence:true
end
