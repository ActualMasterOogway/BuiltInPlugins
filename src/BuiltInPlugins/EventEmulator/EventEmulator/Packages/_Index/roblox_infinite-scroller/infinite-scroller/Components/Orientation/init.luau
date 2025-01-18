local l_Parent_0 = script:FindFirstAncestor("infinite-scroller").Parent;
local v1 = require(l_Parent_0.t);
local v2 = {
    Up = "Orientation.Up", 
    Down = "Orientation.Down", 
    Left = "Orientation.Left", 
    Right = "Orientation.Right"
};
local v3 = {
    isOrientation = v1.union(v1.literal(v2.Up), v1.literal(v2.Down), v1.literal(v2.Left), v1.literal(v2.Right))
};
setmetatable(v2, {
    __index = function(_, v5) --[[ Line: 22 ]] --[[ Name: __index ]]
        -- upvalues: v3 (copy)
        return v3[v5] or error(tostring(v5) .. " is not a valid member of Scroller.Orientation", 2);
    end, 
    __newindex = function() --[[ Line: 26 ]] --[[ Name: __newindex ]]
        error("Scroller.Orientation is read-only", 2);
    end
});
return v2;