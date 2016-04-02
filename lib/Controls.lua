local statesByCode = {}
local statesByName = {}
local callbacksByCode = {}
local callbacksByName = {}


local function changeState( key, scancode, isrepeat, state )
  local currentState = statesByName[ key ]
  statesByCode[ scancode ] = state
  statesByName[ key ] = state
  local callbacka = callbacksByName[ key ]
  local callbackb = callbacksByCode[ scancode ]
  if callbacka then callbacka( key, scancode, isrepeat, state ) end
  if callbackb then callbackb( key, scancode, isrepeat, state ) end
end

local function onKeyPressed( key, scancode, isrepeat )
end
local function onKeyReleased( key, scancode )
end
