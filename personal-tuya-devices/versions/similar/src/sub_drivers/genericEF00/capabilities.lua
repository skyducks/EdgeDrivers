local capabilities = require "st.capabilities"

return {
  capabilities.alarm,
  capabilities.audioMute,
  capabilities.audioVolume,
  -- capabilities.colorControl,
  -- capabilities.colorTemperature,
  capabilities.doorControl,
  capabilities.energyMeter,
  capabilities.keypadInput,
  capabilities.momentary,
  capabilities.switch,
  capabilities.switchLevel,
  capabilities.thermostatCoolingSetpoint,
  capabilities.thermostatHeatingSetpoint,
  capabilities.thermostatMode,
  capabilities.valve,
  capabilities.windowShade,
  capabilities.windowShadeLevel,
  capabilities.windowShadePreset,
}