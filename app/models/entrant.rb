class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps
  field :bib, type: Integer
  field :secs, type: Float
  field :o, type: Placing, :as => :overall
  field :gender, type: Placing
  field :group, type: Placing
  
  store_in collection: 'results'
  
  embeds_many :results, :class_name => "LegResult", :order => [:"event.o".asc], after_add: :update_total, after_remove: :update_total
  
  embeds_one :race, class_name: "RaceRef", :inverse_of => :entrant
  
  
  
  def update_total(value)
    
    total_secs = 0
    
    self.results.each do |result|
      
      total_secs = total_secs + result.secs
    end
    
    self.secs = total_secs
  end
  
  
  def the_race
    self.race.race
  end
  
end
