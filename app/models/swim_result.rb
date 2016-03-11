class SwimResult  < LegResult

field :pace_100, type: Float

def calc_ave

    self[:pace_100] = 1.1

end


end