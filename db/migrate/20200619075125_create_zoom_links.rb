class CreateZoomLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :zoom_links do |t|
      t.string :label
      t.string :link

      t.timestamps
    end
  end
end
