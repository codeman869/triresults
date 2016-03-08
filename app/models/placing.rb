class Placing
   attr_accessor :name, :place
   
   #Class methods
   def self.mongoize object
        case object
        
        when nil
            return nil
        when Hash
            return object
            
        when Placing
            return {
                
                :name => object.name,
                :place => object.place
                
            }
            
        end
   
   end

    def self.demongoize object
       case object
       
       when nil
           return nil
        when Hash
            return Placing.new(object)
        when Placing
            return object
            
        end
        
    end
    
    def self.evolve object
        return self.mongoize object
        
    end
    
    #Instance methods
    
    def initialize(params={:name=>nil,:place=>nil})
        @name = params[:name]
        @place = params[:place]
    end
    
    def mongoize
        return Placing.mongoize self
    end
    
    
end