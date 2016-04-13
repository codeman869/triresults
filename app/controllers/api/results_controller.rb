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
                render html: "/api/races/#{params[:race_id]}/results/#{params[:id]}"
            end
        end
    end

end