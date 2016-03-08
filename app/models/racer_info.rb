class RacerInfo
  include Mongoid::Document
  field :fn, type: String, :as => :first_name
  field :ln, type: String, :as => :last_name
  field :g, type: String, :as => :gender
  field :yr, type: Integer, :as => :birth_year
  field :res, type: Address, :as => :residence
  field :racer_id, :as => :_id
  field :_id, default:->{racer_id}
  
  embedded_in :parent, polymorphic: true
  
  validates :first_name, :last_name, :birth_year, :gender, presence: true 
  validates :gender, inclusion: { in: %w(M F), message: "must be M or F" }
  validates :birth_year, numericality: {less_than: Date.current.year}

end
