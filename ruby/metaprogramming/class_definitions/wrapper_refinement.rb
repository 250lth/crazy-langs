module StringRefinement
  refine String do
    def length
      super > 5 ? 'long' : 'short'
    end
  end
end

using StringRefinement

p "War and Peace".length