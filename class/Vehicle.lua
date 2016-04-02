local Vehicle = require'class''Vehicle'


function Vehicle:addWheel(
      posX, posY,   --where the wheel is relative to the body
      width, length,--size along x and y axises
      restitution,  --restitution per square meter
      steering,     --how much it steers relative to the steering wheel (0 disables steering)
      maxAngle      --how much it can steer (effectively it might steer less, see previous parameter)
    )
end

return Vehicle