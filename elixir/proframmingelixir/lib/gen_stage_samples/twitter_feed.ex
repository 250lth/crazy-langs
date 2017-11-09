alias AdriansHandWavingLibrary.{Tweet,ImageSearch,Collage}
alias Experimental.GenStage

defmodule ReadFromTwitter do
  use GenStage
  def init(twitter_feed) do
    tweets = Tweet.all_to_date(twitter_feed)
    # Note we're setting tweets as the state.
    {:producer, tweets}
  end

  def handle_demand(demand, state) do
    # Pull some tweets out of state. We send those as the events
    # or "things", and we reset state to the remaining tweets.
    # @jacobterpri pointed out the existence of Enum.split/2. Thanks!
    {pulled, remaining} = Enum.split(state, demand)
    {:noreply, pulled, remaining}
  end
end

defmodule ConvertToImages do
  use GenStage
  # This step still needs no state.
  def init(_) do
    {:producer_consumer, :ok}
  end

  # Turn a list of tweets into a list of lists of images.
  def handle_events(tweets, _from, _state) do
    image_lists = Enum.map(tweets, &to_list_of_images(&1))
    {:noreply, image_lists, :ok}
  end

  # Do that by splitting the tweets into individual words and running
  # image_for on each word
  defp to_list_of_images(tweet),
       do: tweet
           |> String.split(" ")
           |> Enum.map(fn word -> ImageSearch.image_for(word) end)
end

defmodule CollageBackToTwitter do
  use GenStage
  # Set state to the one thing this needs to keep track of: where to post
  # collages.
  def init(output_twitter_feed) do
    {:consumer, output_twitter_feed}
  end

  # Get the lists of images, collage them together, and send them back out
  # to Twitter. This is definitely the longest step. There's image manipulation.
  # There's uploading. Then there's tweeting. All of that happens in my pretend
  # modules, but go ahead and pretend. That's a lot of time, isn't it?
  # So if we weren't using GenStage, the CollageBackToTwitter module would
  # require a ton of buffering code. The equivalent of Lucy stuffing chocolates
  # in her hat!
  # Thanks, GenStage.
  def handle_events(image_lists, _from, output_twitter_feed) do
    image_lists
    |> Enum.map(&Collage.images_together(&1))
    |> Enum.each(&Tweet.send_image(&1, output_twitter_feed))
    {:noreply, [], output_twitter_feed}
  end
end

defmodule Go do
  def go do
    # Note we're sending the Twitter names to pull from and push to.
    {:ok, producer} = GenStage.start_link(ReadFromTwitter, "@madcapulet")
    {:ok, prod_con} = GenStage.start_link(ConvertToImages, arg = :nonsense)
    {:ok, consumer} = GenStage.start_link(CollageBackToTwitter, "@bitcapulet")

    # I'm pretending here that I've tuned this stuff and found the following
    # levels of demand to be optimal. Because, hey look! There are a bunch of
    # settings on the sync_subscribe function. Rad.
    GenStage.sync_subscribe(prod_con, to: producer, max_demand: 50)
    GenStage.sync_subscribe(consumer, to: prod_con, max_demand: 10)
  end
end