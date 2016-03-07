class Point
   attr_accessor :longitude, :latitude
   
   #Class Methods
   def self.mongoize object
      case object
        when nil
            return nil
        when Hash
            return object
            
        when Point
            
            return {
                :type => "Point",
                :coordinates => [
                    object.longitude,
                    object.latitude
                    ]
            }
      
      end
   end
   
   def self.demongoize object
      case object
        when nil
            return nil
        when Hash
            return Point.new(object)
        when Point
            return object
      
        end
   end
   
   def self.evolve object
       return self.mongoize object
   end
   
   #Instance Methods
   def initialize(params={:coordinates => [nil, nil]})
       @latitude = params[:coordinates][1]
       @longitude = params[:coordinates][0]
   end
   
   
   def mongoize
      return {
          :type => "Point",
          :coordinates => [
              @longitude,
              @latitude
              ]
      } 
   end
    
end