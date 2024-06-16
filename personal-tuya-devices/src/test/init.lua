local test = require "integration_test"
local zigbee_test_utils = require "integration_test.zigbee_test_utils"
local t_utils = require "integration_test.utils"

require "test.myutils"

require "test.version"

test.load_all_caps_from_profile(t_utils.get_profile_definition("child-bitmap-v1.yaml"))
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-enum-v1.yaml"))
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-raw-v1.yaml"))
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-string-v1.yaml"))
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-value-v1.yaml"))

zigbee_test_utils.prepare_zigbee_env_info()

test.set_test_init_function(function()
  error("You must use your own `test_init`")
end)

local result = test.run_registered_tests()
if result == nil or result.failed > 0 then
  error("Unable to proceed")
end