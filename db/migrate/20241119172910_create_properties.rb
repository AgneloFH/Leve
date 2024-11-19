# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    # Habilita UUIDs para o PostgreSQL
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :properties, id: :uuid do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.float :usable_area, null: false
      t.float :total_area, null: true
      t.integer :bedrooms, default: 0
      t.integer :bathrooms, default: 0
      t.integer :washrooms, default: 0
      t.integer :suites, default: 0
      t.integer :garage_space, default: 0
      t.boolean :accepts_pets
      t.integer :code, null: false

      t.references :property_type, null: false, foreign_key: { to_table: :property_types }, type: :uuid

      t.timestamps
    end

    # Adicionando índice único na coluna code
    add_index :properties, :code, unique: true
  end
end
