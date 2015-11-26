require './jsonnify/loader'
require './jsonnify/filter'
require 'json'

testsuite_excludes = ["properties","system_out","system_err","hostname","id","timestamp","package","name","testcase"]
json = Loader.getJSON("../test/mocks/TESTS-TestSuites.xml")
puts JSON.generate(Loader.createFilter(testsuite_excludes).filter(json,testsuite_excludes))
