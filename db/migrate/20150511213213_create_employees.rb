class CreateEmployees < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:name, :string)

      t.timestamps()
  end

  add_column(:divisions, :employee_id, :integer)
end
end
