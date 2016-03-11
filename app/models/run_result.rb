class RunResult < LegResult

field :mmile, type: Float, :as => :minute_mile

def calc_ave
    if !self.event.nil? && !self.secs.nil?
        miles = self.event.miles
        self[:minute_mile] = self.event.miles.nil? ? nil : (secs / 60) / miles
    end
end

end