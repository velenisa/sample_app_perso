class Document < ActiveRecord::Base

  belongs_to :case
  validates_presence_of :case_id

  attr_accessible :image_low_quality, :name
  has_attached_file :image_low_quality, :styles => { :large => ["600x850>", :jpg], :thumb => ["100x145>", :jpg] }

  validates_attachment_presence :image_low_quality

  def image
    image_low_quality
  end

end
