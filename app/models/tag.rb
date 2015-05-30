class Tag

  TAG1 = []
  TAG2 = []

  #return array of tag1, tag2 which are trending
  def get_trending_tags
    [
      { "tag1" => "play", "tag2" => "football" },
      { "tag2" => "play", "tag2" => "cricket"},
      { "tag2" => "watch", "tag2" => "cricket"},
      { "tag2" => "watch", "tag2" => "movie"},
      { "tag2" => "shop", "tag2" => "shoes"},
    ]
  end

  def autocomplete(params)
    if params["type2"] == "tag1"
      TAG1.select{ |tag| /^#{params["value"]}/ === tag }[0..2]
    else params["type2"] == "tag2"
      TAG2.select{ |tag| /^#{params["value"]}/ === tag }[0..2]
    end
  end

end
