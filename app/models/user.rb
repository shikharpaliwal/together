class User
  include Neo4j::ActiveNode

  property :name, type: String
  property :number, type: String
  property :byline, type: String

  validates :name, :number, presence: true
  validates :number, uniqueness: true

  has_many :out, :friends, type: 'friends', model_class: User
  has_many :out, :participating_in, type: 'participating_in', model_class: Activity

  def self.modified_find_or_create(params)
    params["number"] = params["number"].last(10)
    user = User.where(:number => params["number"]).first
    if user.blank?
      user = User.create(params.select{ |k,v| ["name", "number", "byline"].include? k })
    else
      user.name = params[:name]
      user.byline = params[:byline]
      user.save
    end
    return user
  end

  def self.find_by_session_token(session_token)
    where(:id => session_token).last
  end

  def self.add_friends(user, params)
    p params
    p user
    params["friends"].each do |friend|
      friend_user = modified_find_or_create(friend)
      user.friends << friend_user
    end
  end

end
