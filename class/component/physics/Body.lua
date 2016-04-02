local Body = require'class.Component':subclass'Body'


function Body:initialize( world, ... )
  self.body = world:newBody( ... )
end


function Body:onAddedToGameObject()
  self:assertSingle()
end


return Body