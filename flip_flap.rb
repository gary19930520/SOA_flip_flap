require_relative 'tsv_buddy'
require 'yaml'

class FlipFlap
  include TsvBuddy
  # Do NOT create an initialize method
  def take_yaml(yaml)
  	
  end

  def to_yaml
  	@data.to_yaml # call yaml library and export
  end
end
