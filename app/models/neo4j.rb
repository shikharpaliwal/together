class Neo4j

  def self.to_hash(node)
    data_hash = node["data"]
    data_hash.merge!(node["metadata"])
    return data_hash
  end

  def self.neo
    Neography::Rest.new({:authentication => 'basic', :username => "neo4j", :password => "user"})
  end

end
