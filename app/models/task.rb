class Task < ApplicationRecord
  before_validation :set_unless_name
  belongs_to :user
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma
  has_one_attached :image


  private

  def set_unless_name
    self.name = '名前なし' if name.blank?
  end

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることは出来ません') if name&.include?(',')
  end

end
