module M1
end

module M2
end

module M3
  prepend M1
  include M2
end

p M3.ancestors