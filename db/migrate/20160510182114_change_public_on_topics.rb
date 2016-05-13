class ChangePublicOnTopics < ActiveRecord::Migration
  def up
    change_column_null :topics, :public, false
    change_column_default :topics, :public, true
  end
  
  def down
    change_column_null :topics, :public, true
    change_column_default :topics, :public, nil
  end
end
