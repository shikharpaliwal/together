class User
  include Neo4j::ActiveNode

  property :name, type: String
  property :number, type: String
  property :byline, type: String
  property :session_token, type: String

  validates :name, :number, :session_token, presence: true
  validates :number, uniqueness: true

  has_many :out, :friends, type: 'friends', model_class: User
  has_many :out, :participating_in, type: 'participating_in', model_class: Activity

  def self.modified_find_or_create(params)
    params["number"] = params["number"].last(10)
    params["session_token"] = SecureRandom.base64(64).gsub(/[$=+\/]/,65.+(rand(25)).chr)
    find_or_create(params)
  end

  def self.find_by_session_token(session_token)
    where(:session_token => session_token)
  end

  def self.add_friends(user, params)
    params["friends"].each do |friend|
      friend_user = modified_find_or_create(friend)
      user.friends << friend_user
    end
  end

end
