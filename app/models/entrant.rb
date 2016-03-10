class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps
  field :bib, type: Integer
  field :secs, type: Float
  field :o, type: Placing, :as => :overall
  field :gender, type: Placing
  field :group, type: Placing
  
  store_in collection: 'results'
  
end
