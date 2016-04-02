local GameObject = require'class''GameObject'


function GameObject:initialize()
  self.components = {}
end


function GameObject:addComponent( componentClass, ... )
  local component = componentClass:new( ... )
  self.components[ component ] = true
  self:onComponentAdded( component )
  component:onAddedToGameObject( self )
  return component
end


function GameObject:onComponentAdded( component )
end


function GameObject:invokeMethodOfComponents( name, ... )
  for component in pairs( self.components ) do
    local method = component[ name ]
    if method then
      method( component, ... )
    end
  end
end


return GameObject