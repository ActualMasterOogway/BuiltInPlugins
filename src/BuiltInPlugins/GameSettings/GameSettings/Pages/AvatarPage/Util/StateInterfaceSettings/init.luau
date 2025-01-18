local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.ConstantScaleBoundaries);
local v2 = {};
local v3 = nil;
v2.getHeightBoundaries = function(v4) --[[ Line: 11 ]] --[[ Name: getHeightBoundaries ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v4) and v3(v4).height or v1.Height;
end;
v2.getWidthBoundaries = function(v5) --[[ Line: 15 ]] --[[ Name: getWidthBoundaries ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v5) and v3(v5).width or v1.Width;
end;
v2.getHeadBoundaries = function(v6) --[[ Line: 19 ]] --[[ Name: getHeadBoundaries ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v6) and v3(v6).head or v1.Head;
end;
v2.getBodyTypeBoundaries = function(v7) --[[ Line: 23 ]] --[[ Name: getBodyTypeBoundaries ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v7) and v3(v7).bodyType or v1.BodyType;
end;
v2.getProportionBoundaries = function(v8) --[[ Line: 27 ]] --[[ Name: getProportionBoundaries ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v8) and v3(v8).proportion or v1.Proportion;
end;
v3 = function(v9) --[[ Line: 31 ]]
    return v9.StateSettings and v9.StateSettings.scaleBoundaries.boundaries;
end;
return v2;