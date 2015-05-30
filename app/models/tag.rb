class Tag
  include Neo4j::ActiveNode

  property :tag_do, type: String
  property :tag_what, type: String

  #return array of tag_do, tag_what which are trending
  def self.get_trending_tags
    return Tag.limit(10).collect{ |tag|
      { "tag_do" => tag.tag_do, "tag_what" => tag.tag_what }
    }
  end

  def self.autocomplete(params)
    if params["type"] == "tag_do"
      Tag.where(:tag_do => /#{params["value"].downcase}.*/).limit(3).pluck(:tag_do).uniq
    else params["type"] == "tag_what"
      Tag.where(:tag_do => params["tag_do"].downcase,:tag_what => /#{params["value"].downcase}.*/).limit(3).pluck(:tag_what).uniq
    end
  end

end
