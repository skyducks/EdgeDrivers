### Checklist for new profiles to be used in generic mode

- [ ] Attribute "name" starts with "child-"
- [ ] Attribute "name" ends with "-v1"
- [ ] Attribute "name" matches the file name without file extension
- [ ] File extension is `.yaml`
- [ ] File is in the folder "profiles"
- [ ] There is a single component called `main`
- [ ] New option in generic profile exist and is limited to 24 characters

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
- [ ] Attribute "datapoints" contains a list of datapoints
- [ ] Each datapoint contains attributes id, command and base
- [ ] Attribute "id" is the number of the datapoint
- [ ] Attribute "command" is the command to be used to treat the corresponding datapoint
- [ ] All new commands were created by following the "Checklist for new integrations with native capabilities"
- [ ] Attribute "base" is a generic group of other attributes
- [ ] Attribute "group" references the component of the profile (1=main, 2=main02, N=main0N)

I will update these checklists from time to time as soon as I notice something missing.
