class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :tags, through: :prototype_tags, dependent: :destroy
  has_many :prototype_tags, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images
  accepts_nested_attributes_for :tags, reject_if: :reject_tags, allow_destroy: true

  has_one :main_image, -> { where(status: 0) }, class_name: "CapturedImage"

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def reject_tags(attributes)
    exists = attributes[:id].present?
    empty = attributes[:name].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  Max_sub_image = 3
  def set_sub_thumbnails
    sub_images = captured_images.sub
    Max_sub_image.times { |i| sub_images[i] ||= captured_images.build(status: "sub") }
    sub_images
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end

  def likes_user(user)
    likes.find_by(user_id: user)
  end

  def save_tags(tags)
  current_tags = self.tags.pluck(:name) unless self.tags.nil?
  old_tags = current_tags - tags
  new_tags = tags - current_tags

  # Destroy old taggings:
  old_tags.each do |old_name|
    self.tags.delete Tag.find_by(name:old_name)
  end

  # Create new taggings:
  new_tags.each do |new_name|
    article_tag = Tag.find_or_create_by(name:new_name)
    self.categories << article_tag
  end
  end
end
