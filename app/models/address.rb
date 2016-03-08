class Address
  attr_accessor :city, :state, :location
  

  #Class methods
  def self.mongoize object
      case object
      
      when nil
          return nil
          
        when Hash
            return object
        when Address
            return {
                
                :city => object.city,
                :state => object.state,
                :loc => object.location.mongoize
            }
      end
  end
  
  
  def self.demongoize object
     case object
     
     when nil
         return nil
     when Hash
         return Address.new(object)
     when Address
         return object
    end
      
  end
  
  def self.evolve object
     return self.mongoize object 
  end
  
  #Instance methods
  
  def initialize(params={:city=>nil,:state=>nil,:loc=>nil})
      @city = params[:city]
      @state = params[:state]
      @location = Point.new(params[:loca]) unless params[:loc]==nil
  end
  
  def mongoize
    return Address.mongoize self
  end
  
  
  
end