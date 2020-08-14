class RemovePictureurlFromCocktails < ActiveRecord::Migration[6.0]
  def change
    remove_column :cocktails, :picture_url, :string
  end
end
