class BikeResult < LegResult

field :mph, type: Float

def calc_ave

    self[:mph] = 3.2

end

end