class LegResult
  include Mongoid::Document
  field :secs, type: Float
  
  def initialize(params={:secs=>nil})
    super
    self[:secs] = params[:secs]

  end
  
  def calc_ave
    
  end
  
  after_initialize do |doc|
    
    self.calc_ave
    
  end
  
  
  def secs= value
    self[:secs] = value
  end
  
end
