class Activity
  include Neo4j::ActiveNode

  property :created_at
  property :tag_do, type: String
  property :tag_what, type: String
  property :tag_when, type: String
  property :lat
  property :lon

  validates :tag_do, :tag_what, presence: true

  has_many :in, :participants, type: 'participating_in', model_class: User
  has_one :out, :creator, type: 'created_by', model_class: User

  def self.create_activity(user, params)
    params["tag_when"].downcase!
    activity = Activity.create(params)
    activity.creator = user
    activity.participants << user
  end

  def self.participate(user, params)
    activity = Activity.find(params[:activity_id])
    activity.participants << user
  end

  def self.leave(user, params)
    activity = Activity.find(params[:activity_id])
    activity.participants -= [user]
  end

  def self.search(user, params)
    query = Activity
    query = query.where(:tag_do => params["tag_do"]) if params["tag_do"].present?
    query = query.where(:tag_what => params["tag_what"]) if params["tag_what"].present?
    query = query.where(:tag_when => params["tag_when"]) if params["tag_when"].present?
    activities = query.entries
    response = activities.collect{|activity|
      creator = activity.creator
      {
        "id" => activity.id,
        "creator_name" => creator.name,
        "creator_number" => creator.number,
        "tag_do" => activity.tag_do,
        "tag_what" => activity.tag_what,
        "tag_when" => activity.tag_when,
        "participants" => activity.participants.collect{ |user| { "name" => user.name, "number" => user.number } }
      }
    }
  end

end
