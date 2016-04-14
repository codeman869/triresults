module Api
    
    def self.plainText?(req)
       !req.accept || req.accept == "*/*"
    end
    
   class RacesController < ApplicationController
       def index
        if Api::plainText?(request)
           render plain: "/#{params[:controller]}"
        else
           render html: "/#{params[:controller]}"
        end
       end
       
       def show
           if Api::plainText?(request)
                render plain: "/#{params[:controller]}/#{params[:id]}"
            else
                render html: "/#{params[:controller]}/#{params[:id]}"
            end
       end
        
        
        def create
            if Api::plainText?(request)
               render plain: :nothing, status: :ok 
            else
                render html: :nothing, status: :ok
            end
        end
   end
    
end