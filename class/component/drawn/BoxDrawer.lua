local BoxDrawer = require'class.Component':subclass'BoxDrawer'


BoxDrawer.mode = 'fill'


function BoxDrawer:initialize( width, height, mode )
  self.width, self.height, self.mode = width, height, mode
end


function BoxDrawer:draw()
  love.graphics.rectangle( self.mode, self.width, self.height )
end


return BoxDrawer