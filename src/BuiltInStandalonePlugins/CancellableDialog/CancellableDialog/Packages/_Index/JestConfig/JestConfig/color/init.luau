local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local v3 = {
    "red", 
    "green", 
    "yellow", 
    "blue", 
    "magenta", 
    "cyan", 
    "white"
};
v2.getDisplayNameColor = function(v4) --[[ Line: 40 ]] --[[ Name: getDisplayNameColor ]]
    -- upvalues: v3 (copy)
    if v4 == nil then
        return "white";
    else
        return v3[math.random(#v3)];
    end;
end;
return v2;