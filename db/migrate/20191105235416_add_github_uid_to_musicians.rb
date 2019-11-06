class AddGithubUidToMusicians < ActiveRecord::Migration[6.0]
  def change
    add_column :musicians, :github_uid, :integer
  end
end
