local Component = require'class''Component'


function Component:onAddedToGameObject()
end


function Component:assertSingle( msg )
  local class = self.class
  for component in pairs( self.gameObject.components ) do
    if component:isInstanceOf( class ) and component~=self then
      error( msg or 'component of this type already in use' )
    end
  end
  return self
end


function Component:requireComponentOfType( componentClass, ... )
  for component in pairs( self.gameObject.components ) do
    if component:isInstanceOf( componentClass ) then
      return component
    end
  end
  local component = self.gameObject:addComponent( componentClass, ... )
  return component
end


function Component:assertComponentOfType( componentClass )
  for component in pairs( self.gameObject.components ) do
    if component:isInstanceOf( componentClass ) then
      return component
    end
  end
  error( 'No component of '..tostring( componentClass )..' type found')
end



return Component