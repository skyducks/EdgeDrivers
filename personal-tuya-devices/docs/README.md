## Some important definitions
- Datapoint is an abstract representation of a function/state that your device have. Basically, it is a numeric key that has an associated value
  - The value can be anything... a switch state, a dimmer level, temperature, humidity, ... anything
  - Each device maps its own states to datapoints
- Capability is an abstract function (datapoint) that your device have
- Command is the coding implementation of a capability that runs in the driver
- Profile is an abstract representation for visually grouping capabilities
  - The profile is loaded in the app
- Model is an abstract representation for mapping the datapoints of your device for corresponding commands, using a specific profile by default

## Lifecycles

### Message sent by the device to the app - Sensor
- Device sends a zigbee message to the hub (a datapoint and its associated value)
- Hub forwards the message to the right driver
- Driver receives the message and converts to a command
  - From the message, driver obtains the manufacturer, model, datapoint and value
  - With these informations, driver knows how to convert into a command
- Command is converted into a capability
- Capability is sent to the hub
- Hub forwards to the ST cloud
- ST cloud forwards to the app
- App knows the device and its corresponding profile and updates the view

### Message sent by the app to the device - Actuator
- App forwards the command to the ST cloud
- ST cloud forwards to the hub
- Hub forwards to the right driver
- Driver receives the message and converts to a command
  - From the message, driver obtains manufacurer, model, capability and value
  - With these informations, driver knows how to convert into a command
- Driver converts command to zigbee message and forwards to the hub
- Hub forwards the message to the device
- An equivalent ACK message is sent back to the app so that it may know that the command was success

## Checklists

### Checklist for contributing with your integration - Start here!
- [ ] Model created by following the [Checklist for new models to represent new device](#checklist-for-new-models-to-represent-new-device)
  - [ ] If none of the existing normal profiles fit your device, then create a new one by following the [Checklist for new profiles to be used by models](#checklist-for-new-profiles-to-be-used-by-models)
  - [ ] If none of the existing commands fit your device for an specific datapoint, then create a new one by following the [Checklist for new integrations with native capabilities](#checklist-for-new-integrations-with-native-capabilities)

### Checklist for new preferences in the [generic profile](https://github.com/w35l3y/EdgeDrivers/blob/beta/personal-tuya-devices/profiles/generic-ef00-v1.yaml)
- [ ] Attribute "name" is limited to 24 characters
- [ ] Attribute "name" ends with "Datapoints"
- [ ] All other attributes follow the pattern of the other preferences
- [ ] Updated "datapoint_types_to_fn" from `src/tuyaEF00_generic_defaults.lua` referencing the command implemented at `src/commands.lua`
- [ ] Updated "child_types_to_profile" from `src/tuyaEF00_generic_defaults.lua` referencing the profile created

### Checklist for new profiles to be used in generic mode

- [ ] Attribute "name" starts with "child-"
- [ ] Attribute "name" ends with "-v1"
- [ ] Attribute "name" matches the file name without file extension
- [ ] File extension is `.yaml`
- [ ] File is in the folder "profiles"
- [ ] There is a single component called `main`
- [ ] Generic profile was updated by following the "Checklist for new preferences in the generic profile"

### Checklist for new profiles to be used by models

- [ ] Attribute "name" starts with "normal-"
- [ ] Attribute "name" ends with "-vN" where N starts at 1
- [ ] Attribute "name" matches the file name without file extension
- [ ] File extension is `.yaml`
- [ ] File is in the folder "profiles"
- [ ] There is a single component called `main`
- [ ] Other components exist because of duplicate capabilities
- [ ] All capabilities declared exist

### Checklist for new integrations with native capabilities
- [ ] Implementation added in `src/commands.lua`
- [ ] Created new profile by following the "Checklist for new profiles to be used in generic mode"

### Checklist for new models to represent new device
- [ ] File name is `<manufacturer>` followed by the extension `.yaml`
- [ ] `<manufacturer>` matches exactly with the manufacturer reported by the device
- [ ] File is in the folder `models/<model>`
- [ ] `<model>` folder matches exactly with the model reported by the device
- [ ] Attribute "profiles" contains a single profile
- [ ] The profile referenced matches a file name from `profiles` folder
- [ ] The profile referenced uses "_" instead of "-"
- [ ] The profile referenced was created by following the "Checklist for new profiles to be used by models"
  - This step is only needed if the referenced profile is new
- [ ] Attribute "datapoints" contains a list of datapoints
- [ ] Each datapoint contains attributes id, command and base
- [ ] Attribute "id" is the number of the datapoint
- [ ] Attribute "command" is the command to be used to treat the corresponding datapoint
- [ ] All new commands were created by following the "Checklist for new integrations with native capabilities"
  - This step is only needed if the referenced command is new
- [ ] Attribute "base" is a generic group of other attributes
- [ ] Attribute "group" references the component of the profile (1=main, 2=main02, N=main0N)

I will update these checklists from time to time as soon as I notice something missing.
