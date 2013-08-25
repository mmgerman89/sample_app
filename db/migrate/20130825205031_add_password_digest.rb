class AddPasswordDigest < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    add_column :usuarios, :password_digest, :string
  end
end
