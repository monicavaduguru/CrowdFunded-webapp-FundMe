class LineItem < ActiveRecord::Base
  belongs_to :kid
  belongs_to :cart
end
