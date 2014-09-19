class AddUserIdVotesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :user_id, :integer
    add_column :answers, :votes, :integer, default: 0
  end
end
