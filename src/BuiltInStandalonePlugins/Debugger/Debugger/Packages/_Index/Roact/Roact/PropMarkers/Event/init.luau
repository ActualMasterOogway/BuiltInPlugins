local v0 = require(script.Parent.Parent.Type);
local v1 = {};
local v3 = {
    __tostring = function(v2) --[[ Line: 21 ]] --[[ Name: __tostring ]]
        return ("RoactHostEvent(%s)"):format(v2.name);
    end
};
setmetatable(v1, {
    __index = function(_, v5) --[[ Line: 27 ]] --[[ Name: __index ]]
        -- upvalues: v0 (copy), v3 (copy), v1 (copy)
        local v6 = {
            [v0] = v0.HostEvent, 
            name = v5
        };
        setmetatable(v6, v3);
        v1[v5] = v6;
        return v6;
    end
});
return v1;