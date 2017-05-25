class Pending < ApplicationRecord
  belongs_to :user
  belongs_to :inviter, :foreign_key => "inviter_id", :class_name => "User"
end
