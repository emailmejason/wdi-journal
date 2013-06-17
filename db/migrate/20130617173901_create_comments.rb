class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :commentor_name

      # Exactly the same as t.integer :article_id...
      t.references :article


      t.timestamps
    end
    add_index :comments, :article_id
  end
end
