module YamlBuddy
  def take_yaml(yaml)
  	@data = YAML.load(yaml)
  end

  def to_yaml
  	@data.to_yaml # call yaml library and export
  end
end
