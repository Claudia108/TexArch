class Image < ActiveRecord::Base
  has_attached_file :artifact, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/rails.png"
                    # storage: :s3,
                    # s3_credentials: { bucket: "aws_bucket", :access_key_id => ENV["aws_access_key_id"], :secret_access_key => ENV["aws_secret_access_key"]}
  validates_attachment_content_type :artifact, content_type: /\Aimage\/.*\Z/
end
