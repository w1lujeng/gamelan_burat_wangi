class AddAttachmentImageToPhotographs < ActiveRecord::Migration[5.1]
  def change
    change_table :photos do |t|
      t.attachment :image
    end
  end
end
