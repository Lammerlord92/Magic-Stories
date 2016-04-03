class AddUsageToMembershipCards < ActiveRecord::Migration
  def change
    ## usage es nil si ningún usuario lo usó, o contiene el id del usuario que lo usó.
    add_column :membership_cards, :usage, :integer
  end
end
