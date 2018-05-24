class Book < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def jsonify
    {
      :id => self.id,
      :title => self.title,
      :synopsis => self.synopsis,
      :author => self.author,
      :cover => self.image.url,
    }
  end
end
