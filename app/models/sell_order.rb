class SellOrder < ApplicationRecord

  # RELATIONS
  belongs_to :stock
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true # buyer is optional since there can be orders that have not been filled
  has_one_attached :report

  # VALIDATIONS

  validates :quantity, presence: true, numericality: { only_integer: true, less_than: 50, greater_than: 0 } # limit the amount of stock that can sold at any one time to avoid dumping the stock
  validates :price, presence: true, numericality: { less_than: 500000, greater_than: 0 } # Most expensive stock to date (18/03/2021) is $350,000
  validate :expiration_date_cannot_be_in_the_past
  validates_associated :stock, message: "Not an available stock" # As explained in the message
  validates_associated :seller, message: "Not a valid seller" # As explained in the message. This refers the user table through the relations
  validates_associated :buyer, message: "Not a valid buyer" # As explained in the message. This refers the user table through the relations
  validates :report, content_type: { in: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'], message: "must be JPG, PNG or GIF" } # As explained in the message
  validates :report, size: { less_than: 3.megabytes, message: "must be less than 3MB in size" } # As explained in the message
  # Cloudinary doesn't allow for PDF management in their Free version so had to comment out below (https://cloudinary.com/blog/uploading_managing_and_delivering_pdfs)
  # validates :report, content_type: { in: ['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/pdf'], message: "must be DOC, DOCX or PDF" } 


  protected

    # Checks to make sure the entered date is at a future date
    def expiration_date_cannot_be_in_the_past
      if !expiry_date.blank? && expiry_date < Date.today
        errors.add(:expiry_date, "cannot be in the past")        
      end
    end
    

end
