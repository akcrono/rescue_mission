class AddUserIdVotesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :user_id, :integer
    add_column :answers, :is_best, :boolean, default: false
  end
end
