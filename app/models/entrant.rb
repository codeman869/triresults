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
  
  embeds_one :race, class_name: "RaceRef", :inverse_of => :entrant, autobuild: true
  
  embeds_one :racer, as: :parent, :class_name => "RacerInfo", autobuild: true
  
  delegate :first_name, :first_name=, to: :racer
  delegate :last_name, :last_name=, to: :racer
  delegate :gender, :gender=, to: :racer, prefix: :racer
  delegate :birth_year, :birth_year=, to: :racer
  delegate :city, :city=, to: :racer
  delegate :state, :state=, to: :racer
  
  delegate :name, :name=, to: :race, prefix: "race"
  delegate :date, :date=, to: :race, prefix: "race"
  
  def overall_place
    overall.place if overall
  end
  
  def gender_place
    gender.place if gender
  end
  
  def group_name
    group.name if group
  end
  
  def group_place
    group.place if group
  end
  
  
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
