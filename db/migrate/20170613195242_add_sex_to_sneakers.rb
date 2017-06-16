class AddSexToSneakers < ActiveRecord::Migration[5.0]
  def change
    add_column :sneakers, :sex, :string
  end
end
