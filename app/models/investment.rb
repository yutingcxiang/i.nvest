class Investment < ApplicationRecord
  belongs_to :fund, inverse_of: :investments
  belongs_to :user
end
