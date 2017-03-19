class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :img_url
      t.string :vkontakte
      t.string :twitter
      t.string :facebook
      t.boolean :banned, default: false
      t.timestamp :last_activity
      t.boolean :privileged, default: false

      t.timestamps
    end
  end
end
