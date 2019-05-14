class Post < ApplicationRecord
  has_one_attached :image
  has_many_attached :photos

  scope :with_eager_loading_photos, -> { eager_load photos_attachment: :blob}

  def photos_filesname
    photos.map{|p| p.filename.to_s}
  end
end
