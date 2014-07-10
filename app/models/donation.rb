class Donation < ActiveRecord::Base
belongs_to :kid
belongs_to :user
end
