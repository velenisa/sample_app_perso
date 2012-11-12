class AddAttachmentImageLowQualityToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.has_attached_file :image_low_quality
    end
  end

  def self.down
    drop_attached_file :documents, :image_low_quality
  end
end
