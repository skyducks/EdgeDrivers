const { update_models_zigbee } = require("./helpers");

console.log(
  "dotenv",
  require("dotenv").config({
    path: process.env.GITHUB_ENV,
    debug: true,
    encoding: "utf8",
  })
);

console.log("process.env", process.env);
update_models_zigbee(process.env.DRIVER_FOLDER, process.env.DRIVER_VERSION);
// update_models_lan("event-stream", ({ service_type, domain }) =>
//   [...service_type.split("."), domain].join("/")
// );
