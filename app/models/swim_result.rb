class SwimResult  < LegResult

field :pace_100, type: Float

def calc_ave
    if !self.event.nil? && !self.secs.nil?
        meters = self.event.meters
        self[:pace_100] = self.event.meters.nil? ? nil : secs / (meters / 100)
    end
end


end