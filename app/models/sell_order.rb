class SellOrder < ApplicationRecord

  # RELATIONS
  belongs_to :stock
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true # buyer is optional since there can be orders that have not been fille
  has_one_attached :report

  # VALIDATIONS
  # active_storage_validations
  validates :report, attached: true, content_type: { in: ['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/pdf'], message: "must be DOC, DOCX or PDF" }
  validates :report, size: { less_than: 5.megabytes, message: "must be less than 5MB in size" }

end
