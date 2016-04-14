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
            
            if Api::plainText?(request)
               render plain: renderContent, status: :ok 
            else
                render html: renderContent, status: :ok
            end
        end
   end
    
end