## Basic of const
class Ticket
  # Here is const
  VENUES = ["Convention Center", "Fairgrounds", "Town Hall"]

  attr_accessor :price
  attr_reader :venue, :date

  def initialize(venue, date)
    if VENUES.include?(venue)
      @venue = venue
    else
      raise ArgumentError, "Unknown venue #{venue}."
    end
    @date = date
  end
end

puts "The venues are:"
puts Ticket::VENUES

## Ruby self-defined const
puts RUBY_VERSION
puts RUBY_PATCHLEVEL
puts RUBY_RELEASE_DATE
puts RUBY_COPYRIGHT

## reset and change const
venues = Ticket::VENUES
venues << "High Scholl Gym"
puts venues