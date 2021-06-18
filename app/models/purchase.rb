# class Purchase < ApplicationRecord
#   belongs_to :item
#   belongs_to :user
#   has_one :purchase
#   has_one_attached :image

#   validates :content, presence: true, unless: :was_attached?

#   def was_attached?
#     self.image.attached?
#   end
# end