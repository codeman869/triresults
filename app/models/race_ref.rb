class RaceRef
  include Mongoid::Document
  field :n, type: String, as: :name
  field :date, type: Date
  
  embedded_in :entrant, :inverse_of => :race
  belongs_to :race, foreign_key: "_id"
  
end
