const { update_models_zigbee } = require("./helpers");

console.log(
  "process.env",
  process.env.WSL_1,
  process.env.WSL_2,
  process.env.WSL_3,
  process.env.WSL_4,
  process.env.WSL_5,
  process.env.DRIVER_FOLDER,
  process.env.DRIVER_VERSION
);
update_models_zigbee(process.env.DRIVER_FOLDER, process.env.DRIVER_VERSION);
// update_models_lan("event-stream", ({ service_type, domain }) =>
//   [...service_type.split("."), domain].join("/")
// );
