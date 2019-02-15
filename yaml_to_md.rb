# This script will parse a 'metadata.yaml' file to a 'README.md'
# It is designed to be part of the deployer
# the .md file was built to work on github and may require further work
# for a different git provider
require 'yaml'
require 'json'

# Declare constants
READ_FROM = 'metadata.yaml'
WRITE_TO = 'README.md'

# Check if metadata.yaml file exists
# don't run parser if not
if File.exist?(READ_FROM)
  readme = YAML.load_file(READ_FROM)
  readme_string = ''
  
  # README.md disclaimer
  readme_string += "```\n"
  readme_string += "This readme is generated from metadata.yaml. Manual changes to this file will be overwritten\n"
  readme_string += "```\n\n"

   readme.each do |key, val|
    # Title heading
    if key == 'name'
      readme_string += "# #{val}\n"
    end

    # Special formatting for terraform section
    if key == 'terraform'
      readme_string += "\n## terraform \n"
      readme_string += "```\n"
      readme['terraform'].each do |region, val|
        readme_string += "#{region}: \n"
        val.each do |environment, value|
          if environment == 'stg'
            readme_string += "  #{environment}: \n"
            readme_string += "    cluster_habitation_override: " +
            "#{value['cluster_habitation_override']}\n"
          else
          readme_string += "  #{environment}: \n"
          readme_string += "    node_count: " + "#{value['node_count']} \n"
          readme_string += "    node_type: " + "#{value['node_type']}\n"
          end
        end
      end
    readme_string += "```\n"

    # Special formatting for contributors section
    elsif key == 'contributors'
      readme_string += "\n"
      readme_string += "## contributors \n"
      readme_string += "| Name | Email |\n"
      readme_string += "| ---- | ---- |\n"
      readme['contributors'].each do |cont|
        readme_string += "|#{cont['name']}"
        readme_string += "|#{cont['email']}|\n"
      end
      readme_string += "\n"

    # Generic formatting for any simple key => value pairs
    elsif val.is_a? String
      readme_string += "\n"
      # Skip name key because as it was displayed as title
      if key == 'name'
      else
        readme_string += "## #{key}\n"
        readme_string += "  #{val}\n"
      end
    # Generic formatting for any arrays
    elsif val.is_a? Array
      readme_string += "\n"
      readme_string += "## #{key} \n"
      val.each do |v|
        readme_string += "- #{v} \n"
      end
    # If we ever need to parse a Hash we have built a section for it
    elsif val.is_a? Hash
       # puts 'hash'
    end
  end

  # If needed, create README.md file and write to it,
  # otherwise, will edit existing README.md file
  File.write(WRITE_TO, readme_string)
  # puts readme_string
end
