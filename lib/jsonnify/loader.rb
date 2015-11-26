require 'crack'
require 'json'

class Loader

	@testsuite_groupers = ["properties","system_out","system_err","hostname","id","package","timestamp","name"]

	def self.getJSON(path_to_file)
		myXML  = Crack::XML.parse(File.read(path_to_file))
		return JSON.parse(myXML.to_json)
	end

	def self.createFilter(excludes)
		if @testsuite_groupers.all? { |i| excludes.include?(i) }
			(not excludes.include?("testcase")) ? (return "JAVI") : (return Filter1.new) 
		else
			(not excludes.include?("testcase")) ? (return "JAVI2") : (return "JAVI3") 
		end
	end
end

require './jsonnify/filter'