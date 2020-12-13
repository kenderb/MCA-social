class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :photo, default: 'default_photo.png'
      t.string :cover_image, default: 'default_cover.jpg'

      t.timestamps
    end
  end
end
