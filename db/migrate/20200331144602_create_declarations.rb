class CreateDeclarations < ActiveRecord::Migration[6.0]
  def change
    create_table :declarations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :document

      t.timestamps
    end
  end
end
