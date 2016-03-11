class RunResult < LegResult

field :mmile, type: Float, :as => :minute_mile

def calc_ave
    self[:minute_mile] = 1.1
end

end