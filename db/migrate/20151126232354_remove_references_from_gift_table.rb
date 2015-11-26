class RemoveReferencesFromGiftTable < ActiveRecord::Migration
  def change
    remove_reference :gifts, :user, index: true, foreign_key: true
  end
end
