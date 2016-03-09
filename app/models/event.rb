class Event
  include Mongoid::Document
  field :o, type: Integer, as: :order
  field :n, type: String, as: :name
  field :d, type: Float, as: :distance
  field :u, type: String, as: :units
  
  embedded_in :parent, :polymorphic => true, touch: true

  def meters
    
    unless self.units.nil? && self.distance.nil?
      case self.units
      
      when "miles"
        return self.distance * 1609.34
      when "kilometers"
        return self.distance * 1000
      when "yards"
        return self.distance * 0.9144
      when "miles"
        return self.distance * 1609.34
      when "meters"
        return self.distance
      end
    else
      return nil
    end
    
  end
  
  def miles
    unless self.units.nil? && self.distance.nil?
      case self.units
      
      when "meters"
        return self.distance * 0.000621371
      when "kilometers"
        return self.distance * 0.621371
      when "yards"
        return self.distance * 0.000568182
      when "miles"
        return self.distance
        
      end
    else
      return nil
    end
  end
end
