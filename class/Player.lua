local Player = require'class.GameObject':subclass'Player'

Player.width = 1.2
Player.height = 3.6


function Player:initialize( world, x, y )
  self:addComponent( require'class.component.drawn.BoxDrawer', self.width, self.height )
  self:addComponent( require'class.component.physics.Body', world, x, y, 'dynamic' )
end


return Player