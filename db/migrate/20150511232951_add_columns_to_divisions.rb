class AddColumnsToDivisions < ActiveRecord::Migration
  def change
    add_column(:divisions, :employee_id, :integer)
  end
end
