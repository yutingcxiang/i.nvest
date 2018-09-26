class Investment < ApplicationRecord
  belongs_to :fund
  belongs_to :user
end
