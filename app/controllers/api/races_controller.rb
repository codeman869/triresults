module Api
    
    def self.plainText?(req)
       !req.accept || req.accept == "*/*"
    end
    
   class RacesController < ApplicationController
       def index
        
        renderContent =   "/#{params[:controller]}" 
        
        if params[:offset] && params[:limit]
           renderContent << ", offset=[#{params[:offset]}], limit=[#{params[:limit]}]" 
        end
           
        if Api::plainText?(request)
           render plain: renderContent
        else
           render html: renderContent
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
            renderContent = :nothing
            
            if params[:race][:name]
               renderContent = params[:race][:name] 
            end
           #byebug
            if Api::plainText?(request)
               render plain: renderContent, status: :ok
               
            else
                race = Race.create(race_params)
            
                render plain: renderContent, status: :created if race.persisted?
                
            end
            
            
            
        end
        
        
      private
      
      
        def race_params
           params.require(:race).permit(:name,:date) 
        end
   end
    
end