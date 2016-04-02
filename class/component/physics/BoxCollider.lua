local BoxCollider = require'class.Component':subclass'BoxCollider'
local Body = require'class.component.physics.Body'


function BoxCollider:initialize( 


function BoxCollider:onAddedToGameObject()
  local body = self:assertComponentOfType( Body )
end