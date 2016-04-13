module Api
    
    def self.plainText?(req)
       !req.accept || req.accept == "*/*"
    end

    class EntriesController < ApplicationController
        def index
            if Api::plainText?(request)
                render plain: "/api/racers/#{params[:racer_id]}/entries"
            else
                render html: "/api/racers/#{params[:racer_id]}/entries"
            end
        end
        
        def show
            if Api::plainText?(request)
                render plain: "/api/racers/#{params[:racer_id]}/entries/#{params[:id]}" 
            else
                render html: "/api/racers/#{params[:racer_id]}/entries/#{params[:id]}"
            end
        end
    end

end