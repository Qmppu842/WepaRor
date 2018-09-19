class AddUserIdToRaitings < ActiveRecord::Migration[5.2]
  def change
    add_column :raitings, :user_id, :integer
  end
end
