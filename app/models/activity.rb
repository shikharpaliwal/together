class Activity
  include Neo4j::ActiveNode

  # LABEL = "Activity"

  # # PARAMS
  # #tag1* => “play”
  # #tag2* => “game”
  # #lat => “23.2323”
  # #lon => “23.2323”
  # def search(params, user_node)
  # end

  # def create(params, user_node)
  # end

  # def participate(params, user_node)
  #   activity_node = neo.find_nodes_labeled(LABEL, { :id => params[:activity_id] })
  #   neo.create_relationship("participate", user_node, activity_node)
  # end

  # def leave(params, user_node)
  #   activity_node = neo.find_nodes_labeled(LABEL, { :id => params[:activity_id] })
  #   neo.create_relationship("participate", user_node, activity_node)
  # end


  property :tag_on, type: String
  property :tag_what, type: String
  property :tag_what, type: String

  validates :tag_on, :tag_what, presence: true

end
