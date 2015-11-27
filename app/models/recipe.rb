class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes
  validates :chef_id, presence: true
  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :summary, presence: true, length: {minimum: 10, maximum: 150}
  validates :description, presence: true, length: {minimum: 50, maximum: 500}

  mount_uploader :picture, PictureUploader

  validate :picture_size



  # numbers of likes
  def get_likes
    self.likes.where(like: true).size
  end

  # numbers of likes
  def get_dislikes
    self.likes.where(like: false).size
  end

  private
    # validation on the server side
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, 'The picture size must be less than 5 MB')
      end
    end
end
