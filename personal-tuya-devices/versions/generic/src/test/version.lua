require "test.generic-ef00-v1"
--require "test.normal-multi-switch-v1"
--require "test.custom-multi-switch-v4"
--require "test.normal-multi-switch-v4"
--require "test.switch-all-multi-switch-v4"
--require "test.custom-multi-switch-v6"
--require "test.normal-multi-switch-v6"
--require "test.switch-all-multi-switch-v6"
--require "test.normal-multi-dimmer-v1"
--require "test.custom-multi-dimmer-v2"
--require "test.normal-multi-dimmer-v2"
--require "test.switch-all-multi-dimmer-v2"
--require "test.normal-single-dimmer-v1"
--require "test.normal-airQuality-v1"
--require "test.normal-airQuality-v2"
--require "test.normal-temphumi-v1"
--require "test.normal-temphumibatt-v1"
--require "test.normal-presenceSensor-v1"
--require "test.normal-garageDoor-v1"
--require "test.normal-powerMeter-v1"
--require "test.normal-irrigation-v1"
--require "test.normal-irrigation-v2"

local profile = t_utils.get_profile_definition("generic-ef00-v1.yaml")

test.load_all_caps_from_profile(profile)
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-enum-v1.yaml"))
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-value-v1.yaml"))
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-string-v1.yaml"))
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-bitmap-v1.yaml"))
test.load_all_caps_from_profile(t_utils.get_profile_definition("child-raw-v1.yaml"))
