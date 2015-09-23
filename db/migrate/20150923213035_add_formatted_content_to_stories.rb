class AddFormattedContentToStories < ActiveRecord::Migration
  def change
    add_column :stories, :formatted_content, :string
  end
end
