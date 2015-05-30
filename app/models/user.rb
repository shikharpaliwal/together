class User
  include Neo4j::ActiveNode

  # LABEL = "User"
  # INDEX = "session_token"
  # UNIQUE_KEY = "number"

  # def self.find_or_create(params)
  #   params = params.select{ |k,v| ["name", "number", "byline"].include? k }
  #   params["number"] = params["number"].last(10)
  #   params["session_token"] = SecureRandom.base64(64).gsub(/[$=+\/]/,65.+(rand(25)).chr)
  #   node = neo.create_unique_node(INDEX,UNIQUE_KEY,params[UNIQUE_KEY],params)
  #   neo.add_label(node, LABEL)
  #   neo.set_node_properties(node, params.select{ |k,v| ["name", "byline"].include? k })
  #   return neo.get_node(node["metadata"]["id"])
  # end

  # def self.add_friends(user_node, params)
  #   params["friends"].each do |friend|
  #     friend_node = find_or_create(friend)
  #     neo.create_relationship("friends", user_node, friend_node)
  #   end
  # end

  # def self.find_by_session_token(session_token)
  #   node = neo.find_nodes_labeled(LABEL, { :session_token => session_token })
  #   return node
  # end

  property :name, type: String
  property :number, type: String
  property :byline, type: String

  validates :name, :number, presence: true
  validates :number, uniqueness: true


end
