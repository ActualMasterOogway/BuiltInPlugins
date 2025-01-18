local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = v1.PureComponent:extend("CameraProvider");
v2.render = function(v3) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    return v1.oneChild(v3.props[v1.Children]);
end;
return v2;