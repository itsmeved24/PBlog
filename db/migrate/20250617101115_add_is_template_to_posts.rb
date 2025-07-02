class AddIsTemplateToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :is_template, :boolean
  end
end
