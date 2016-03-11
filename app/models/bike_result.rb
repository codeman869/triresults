class BikeResult < LegResult

field :mph, type: Float

def calc_ave
    if !self.event.nil? && !self.secs.nil?
        miles = self.event.miles
        self[:mph] = self.event.miles.nil? ? nil : miles * 3600 / secs
    end
end

end