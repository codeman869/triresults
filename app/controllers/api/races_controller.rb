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
           #byebug
            if params[:id].nil?
                render :nothing
            end
            
          
           
           if Api::plainText?(request)
                render plain: "/#{params[:controller]}/#{params[:id]}"
            else
                
                @race = Race.find(params[:id])
                #render json: race, status: :ok
                #render @race
            end
       end
        
        
        def create
            
            renderContent = :nothing
            
            if params[:race] && params[:race][:name]
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
        
        def update
            #byebug
            Rails.logger.debug("method=#{request.method}")
            race = Race.find(params[:id])
            
            race.update(race_params)
            
            
            render json: race, status: :ok
        end
        
        def destroy
            #byebug
            Race.find(params[:id]).delete
            render :nothing => true, :status => :no_content
        end
        
        rescue_from Mongoid::Errors::DocumentNotFound do |exception|
            
            if Api::plainText?(request)
            
                render plain: "Whoops, cannot find race[#{params[:id]}]", status: :not_found
                
            else
               
               render :status => :not_found, :template => "api/races/error_msg", :locals => {
                   
                   :msg => "Whoops, cannot find race[#{params[:id]}]"
               }
                
            end
            
        end
        
        
      private
      
      
        def race_params
           params.require(:race).permit(:name,:date) 
        end
   end
    
end