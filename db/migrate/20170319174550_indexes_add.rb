class IndexesAdd < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :vkontakte
    add_index :users, :twitter
    add_index :users, :facebook
  end
end
