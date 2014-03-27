# See http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
Sequel.migration do
  change do
    create_table :comments do
      primary_key :id
      datetime :created_at, :null => false
      datetime :updated_at, :null => false
      integer :photo_id, :null => false
      string :contents, :null => false
    end
  end
end
