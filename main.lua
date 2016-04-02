local world
local m2px = 64

local time = 0
local gameSpeed = 1
local adjustedDelta = 0

local screenWidth, screenHeight = 0, 0

local input = {
  gas = 0,
  steer = 0
}
local handling = {
  steeringLock = math.rad( 30 ),--degrees in both directions
  density = 1,
  torquePerSec = 0.5,
  acceleration = 0.4,
  breaking = 0.2,
}
local player = {
  body = nil,--reference to box2d physics body
  gfxBody = nil,
  gfxWheel = nil,
  width = 1.5,
  height = 3.2,
}


function love.load()
  package.loaded.class = require'lib.middleclass'
  
  world = love.physics.newWorld( 0, 0, true )
  player.body = love.physics.newBody( world, 0, 0, 'dynamic' )
  local shape = love.physics.newRectangleShape( player.width, player.height )
  love.physics.newFixture( player.body, shape, handling.density )
  
  love.resize( love.graphics.getDimensions() )
  
  love.keyboard.setKeyRepeat( true )
end

function love.draw()
  local OX, OY = screenWidth/2, screenHeight/2
  love.graphics.push()
    love.graphics.translate( OX, OY )
    love.graphics.scale( m2px, -m2px )
    
    love.graphics.push()
      love.graphics.translate( player.body:getPosition() )
      love.graphics.rotate( player.body:getAngle() )
      love.graphics.rectangle( 'fill', -player.width/2, -player.height/2, player.width, player.height )
    love.graphics.pop()
    
  love.graphics.pop()
end

function love.update( dt )
  dt = dt*gameSpeed
  if love.keyboard.isDown'left' or love.keyboard.isDown'a' then
    player.body:applyTorque( handling.torquePerSec*dt )
  elseif love.keyboard.isDown'right' or love.keyboard.isDown'd' then
    player.body:applyTorque( -handling.torquePerSec*dt )
  elseif love.keyboard.isDown'up' or love.keyboard.isDown'w' then
    player.body:applyForce( player.body:getLocalVector( 0, handling.acceleration*dt ) )
  elseif love.keyboard.isDown'down' or love.keyboard.isDown's' then
    player.body:applyForce( player.body:getLocalVector( 0, -handling.breaking*dt ) )
  end
  
  world:update( dt * gameSpeed )
  time = time + dt
  love.window.setTitle( "time="..time )
end

function love.resize( w, h )
  screenWidth, screenHeight = w, h
end

