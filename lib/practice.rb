require 'pry'

# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
        @red = ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']
        @green = ['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore']
        @orange = ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
      end

      def stops_between_stations(startStation,
                                 startLine,
                                 stopStation,
                                 stopLine)

        start_line = return_line(startLine)
        stop_line = return_line(stopLine)
        if start_line == stop_line
          stops = (start_line.index(startStation) -
                 start_line.index(stopStation)).abs
        else
          first_line_stops = (start_line.index(startStation) -
                              start_line.index("Park Street")).abs
          second_line_stops = (stop_line.index("Park Street") -
                              stop_line.index(stopStation)).abs
          stops = first_line_stops + second_line_stops
        end
        puts "There are #{stops} stops between these stations"
      end

      def return_line(station)
        if station == 'Red Line'
          return @red
        elsif station == 'Green Line'
          return @green
        elsif station == 'Orange Line'
          return @orange
        end
      end
    end
# One line, all the stations on that line
# class Line
#   def initialize(line)
#     @line = line
#   end
#
#   def get_line
#     @line
#   end
# end
# # One station
# class Station
#   def initialize(station)
#     @station = station
#   end
#
#   def get_station
#     @station
  end
end

MBTA::Subway::System.new
# stops_between_stations("South Station","Red Line","Back Bay","Orange Line")
