class AddAttachmentPhotoCoverImageToUsers < ActiveRecord::Migration[6.0]
  def self.up
    change_table :users do |t|
      t.attachment :photo
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :users, :photo
    remove_attachment :users, :cover_image
  end
end
