class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :oshi_log
end
