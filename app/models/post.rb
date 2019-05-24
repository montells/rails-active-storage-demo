class Post < ApplicationRecord
  has_one_attached :image
  has_many_attached :photos

  scope :with_eager_loading_photos, -> {eager_load photos_attachment: :blob}

  attr_accessor :remove_photos
  after_save do
    Array(remove_photos).each { |id| photos.find_by_id(id).try(:purge) }
  end

  def photos_filesname
    photos.map {|p| p.filename.to_s}
  end

  def watermarked_image
    image.variant(
        combine_options: {
            gravity: 'center',
            draw: 'image Over 0,0 200,100 "' + Rails.root.join("public/watermark.png").to_s + '"'
        }
    )
  end
end
