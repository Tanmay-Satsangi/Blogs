class AddColumnToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :dob, :datetime
    add_column :users, :favourite_topics, :string, array: true, default: []
    add_column :users, :address, :json  #{address1: "add1", city1: "city1", address2: "address2"; city2: "city2"}
    add_column :users, :contact_number, :json #{primary_number: "+91 1234567890", secondary_number: "+91 1234567890"}
    add_column :users, :followers, :integer

    add_reference :user, :country
  end
end
