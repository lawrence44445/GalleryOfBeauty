class Photo < Sequel::Model(:photos)
  one_to_many :comments
end
