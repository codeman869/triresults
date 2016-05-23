module Api
        
    def self.plainText?(req)
       !req.accept || req.accept == "*/*"
    end

    class ResultsController < ApplicationController
       
        def index
            if Api::plainText?(request)
                render plain: "/api/races/#{params[:race_id]}/results"
            else
                render html: "/api/races/#{params[:race_id]}/results"
            end
        end
        
        def show
            if Api::plainText?(request)
                render plain: "/api/races/#{params[:race_id]}/results/#{params[:id]}" 
            else
                @result = Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
                
                render :partial => "result", :object => @result
                #render html: "/api/races/#{params[:race_id]}/results/#{params[:id]}"
            end
        end
        
        def update
           #byebug
           @entrant = Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
            
            result = params[:result]
            
            if result
                if result[:swim]
                    @entrant.swim = @entrant.race.race.swim
                    @entrant.swim_secs = result[:swim].to_f
                end
                
                if result[:t1]
                    @entrant.t1 = @entrant.race.race.t1
                    @entrant.t1_secs = result[:t1].to_f
                end
                
                if result[:bike]
                   @entrant.bike = @entrant.race.race.bike
                   @entrant.bike_secs = result[:bike].to_f
                end
                
                if result[:t2]
                   @entrant.t2 = @entrant.race.race.t2
                   @entrant.t2_secs = result[:t2].to_f
                end
                
                if result[:run]
                   @entrant.run = @entrant.race.race.run
                   @entrant.run_secs = result[:run].to_f
                end
                #byebug
                if @entrant.save
                    unless Api::plainText?(request)
                        render :partial => "result", :object => @entrant, :status => :ok
                    else
                       
                        render :nothing => true, :status => :ok 
                    end
                else
                    render :nothing => true, :status => :internal_server_error
                end
            else
                render :nothing => true, :status => :bad_request
            end
            
            
        
        end
        
        
        rescue_from ActionView::MissingTemplate do |exeption|
            render plain: "#{exception}", :status => :ok 
         end
        
        private
        
        def results_params
           params.require(:result).permit(:swim,:t1,:bike,:t2,:run) 
        end
    end

end