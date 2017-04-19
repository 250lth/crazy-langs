val dogBreeds = List(Some("Doberman"), None, Some("Yorkshire Terrier"),
                      Some("Dachshund"), None, Some("Scottish Terrier"),
                      None, Some("Great Dane"), Some("Portuguese Water Dog"))

println("first pass:")
for {
  breedOption <- dogBreeds
  breed <- breedOption
  upcaseBreed = breed.toUpperCase()
} println(upcaseBreed)

println("second pass:")
for {
  Some(breed) <- dogBreeds
  upcaseBreed = breed.toUpperCase()
} println(upcaseBreed)