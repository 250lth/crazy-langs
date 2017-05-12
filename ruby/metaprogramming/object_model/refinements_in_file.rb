module StringExtensions
  refine String do
    def to_alphanumeric
      gsub(/[^\w\s]/, '')
    end
  end
end

#"my *1st* refinement!".to_alphanumeric => fault

# call using to use it
using StringExtensions

p "my *1st* refinement!".to_alphanumeric
