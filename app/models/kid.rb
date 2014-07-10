class Kid < ActiveRecord::Base
  has_many :donations
  has_many :users, :through => :donations
  has_many  :line_items
  before_destroy :ensure_no_line_item
  validates :name, presence: true
  validates :image_url, presence: true
  validates :age, presence: true
  validates :purpose, presence: true ,inclusion: { in: ["Education","Recreation"]}
  validates :money_required, presence: true,numericality: { only_integer: true }
  validates :money_received, presence: true,numericality: { only_number: true }
  validates :comments, presence: true
  validates :address, presence: true

  
  private
  def ensure_no_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base,'Line Items present')
      return false
    end
  end

end
