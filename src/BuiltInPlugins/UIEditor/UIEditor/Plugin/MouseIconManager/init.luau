local v0 = {};
local v1 = require(script.Parent.Enum.Direction);
local v2 = {
    [v1.E] = "rbxasset://textures/StudioUIEditor/icon_resize2.png", 
    [v1.SE] = "rbxasset://textures/StudioUIEditor/icon_resize3.png", 
    [v1.S] = "rbxasset://textures/StudioUIEditor/icon_resize4.png", 
    [v1.SW] = "rbxasset://textures/StudioUIEditor/icon_resize1.png", 
    [v1.W] = "rbxasset://textures/StudioUIEditor/icon_resize2.png", 
    [v1.NW] = "rbxasset://textures/StudioUIEditor/icon_resize3.png", 
    [v1.N] = "rbxasset://textures/StudioUIEditor/icon_resize4.png", 
    [v1.NE] = "rbxasset://textures/StudioUIEditor/icon_resize1.png"
};
local v3 = {
    [v1.E] = "rbxasset://textures/StudioUIEditor/icon_rotate1.png", 
    [v1.SE] = "rbxasset://textures/StudioUIEditor/icon_rotate2.png", 
    [v1.S] = "rbxasset://textures/StudioUIEditor/icon_rotate3.png", 
    [v1.SW] = "rbxasset://textures/StudioUIEditor/icon_rotate4.png", 
    [v1.W] = "rbxasset://textures/StudioUIEditor/icon_rotate5.png", 
    [v1.NW] = "rbxasset://textures/StudioUIEditor/icon_rotate6.png", 
    [v1.N] = "rbxasset://textures/StudioUIEditor/icon_rotate7.png", 
    [v1.NE] = "rbxasset://textures/StudioUIEditor/icon_rotate8.png"
};
local v4 = {
    DEFAULT = 0, 
    MOVE = 1, 
    RESIZE = 2, 
    ROTATE = 3
};
local v5 = nil;
local l_DEFAULT_0 = v4.DEFAULT;
local l_NOT_SET_0 = v1.NOT_SET;
local v8 = nil;
v0.calcMouseIconDirection = function(_, v10, v11) --[[ Line: 59 ]] --[[ Name: calcMouseIconDirection ]]
    -- upvalues: v1 (copy)
    local v12 = v1:directionToAngle(v10);
    return v1:angleToDirection(v12 + v11);
end;
v0.setToDefaultIcon = function(_) --[[ Line: 67 ]] --[[ Name: setToDefaultIcon ]]
    -- upvalues: l_DEFAULT_0 (ref), v4 (copy), v8 (ref), v5 (ref), l_NOT_SET_0 (ref), v1 (copy)
    if l_DEFAULT_0 ~= v4.DEFAULT then
        l_DEFAULT_0 = v4.DEFAULT;
        v8.Icon = v5;
        l_NOT_SET_0 = v1.NOT_SET;
    end;
end;
v0.setToMoveIcon = function(_) --[[ Line: 78 ]] --[[ Name: setToMoveIcon ]]
    -- upvalues: l_DEFAULT_0 (ref), v4 (copy), v8 (ref), l_NOT_SET_0 (ref), v1 (copy)
    if l_DEFAULT_0 ~= v4.MOVE then
        l_DEFAULT_0 = v4.MOVE;
        v8.Icon = "rbxasset://textures/advClosed-hand.png";
        l_NOT_SET_0 = v1.NOT_SET;
    end;
end;
v0.setToResizeIcon = function(_, v16) --[[ Line: 91 ]] --[[ Name: setToResizeIcon ]]
    -- upvalues: v1 (copy), l_DEFAULT_0 (ref), v4 (copy), l_NOT_SET_0 (ref), v8 (ref), v2 (copy)
    assert(v1:isValid(v16), "The handle direction was not valid.");
    if l_DEFAULT_0 == v4.RESIZE and l_NOT_SET_0 ~= v16 or l_DEFAULT_0 ~= v4.RESIZE then
        l_DEFAULT_0 = v4.RESIZE;
        v8.Icon = v2[v16];
        l_NOT_SET_0 = v16;
    end;
end;
v0.setToRotateIcon = function(_, v18) --[[ Line: 102 ]] --[[ Name: setToRotateIcon ]]
    -- upvalues: v1 (copy), l_DEFAULT_0 (ref), v4 (copy), l_NOT_SET_0 (ref), v8 (ref), v3 (copy)
    assert(v1:isValid(v18), "The handle direction was not valid.");
    if l_DEFAULT_0 == v4.ROTATE and l_NOT_SET_0 ~= v18 or l_DEFAULT_0 ~= v4.ROTATE then
        l_DEFAULT_0 = v4.ROTATE;
        v8.Icon = v3[v18];
        l_NOT_SET_0 = v18;
    end;
end;
v0.Off = function(_, _) --[[ Line: 115 ]] --[[ Name: Off ]]
    -- upvalues: v0 (copy), v8 (ref), v5 (ref)
    v0:setToDefaultIcon();
    v8 = nil;
    v5 = nil;
end;
v0.On = function(_, v22) --[[ Line: 125 ]] --[[ Name: On ]]
    -- upvalues: v8 (ref), v5 (ref), l_DEFAULT_0 (ref), v4 (copy), l_NOT_SET_0 (ref), v1 (copy)
    assert(v22 ~= nil, "Cannot initialize MouseIconManager. Got a nil mouse.");
    assert(v22.Icon ~= nil, "Cannot initialize MouseIconManager. The mouse icon was nil");
    v8 = v22;
    v5 = v22.Icon;
    l_DEFAULT_0 = v4.DEFAULT;
    l_NOT_SET_0 = v1.NOT_SET;
end;
return v0;