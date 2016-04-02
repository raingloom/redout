local Body = require'class''Body'


function Body:initialize( world, ... )
  self.body = world:newBody( ... )
end


function Body:onAddedToGameObject( object )
  self:assertSingle()
end


return Body