# See http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
Sequel.migration do
  change do
    create_table :photos do
      primary_key :id
      string :filename, :null => false
      datetime :created_at, :null => false
      datetime :updated_at, :null => false
      #description of the image
      string :description
      string :title
    end
  end
end
