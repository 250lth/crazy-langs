require 'ghee'

gh = Ghee.basic_auth("usr", "pwd")
all_gists = gh.users("nusco").gists
a_gist = all_gists[20]

p a_gist.url
p a_gist.description
p a_gist.star