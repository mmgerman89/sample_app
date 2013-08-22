class IndexaEmailUsuarios < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    add_index :usuarios, :email, unique: true
  end
end
