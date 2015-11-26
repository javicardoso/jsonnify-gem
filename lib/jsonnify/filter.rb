class Filter

	@json 	

	def filter(json,excludes)
		(json["testsuites"]["testsuite"]).each do |tests_suite|
			excludes.each { |key| tests_suite.delete(key) }
		end
		@json = json
	end
end

class Filter1 < Filter
	def filter(json,excludes)
		super
		return (@json["testsuites"]["testsuite"]).inject({"total" => 0, "errors" => 0, "failures" => 0, "time" => 0.0}) do |memory,value|
			memory["total"] += (value["tests"]).to_i
			memory["errors"] += (value["errors"]).to_i
			memory["failures"] += (value["failures"]).to_i
			memory["time"] += (value["time"]).to_f
			memory
		end
	end
end

class Filter2 < Filter
	def filter(json,excludes)
		super
	end
end