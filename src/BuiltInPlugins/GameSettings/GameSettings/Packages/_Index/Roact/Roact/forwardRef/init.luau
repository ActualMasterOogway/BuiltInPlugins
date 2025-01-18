local v0 = require(script.Parent.assign);
local v1 = require(script.Parent.None);
local v2 = require(script.Parent.PropMarkers.Ref);
local v3 = require(script.Parent.GlobalConfig).get();
local v4 = {
    [v2] = v1
};
return function(v5) --[[ Line: 15 ]] --[[ Name: forwardRef ]]
    -- upvalues: v3 (copy), v2 (copy), v0 (copy), v4 (copy)
    if v3.typeChecks then
        assert(typeof(v5) == "function", "Expected arg #1 to be a function");
    end;
    return function(v6) --[[ Line: 20 ]]
        -- upvalues: v2 (ref), v0 (ref), v4 (ref), v5 (copy)
        local v7 = v6[v2];
        local v8 = v0({}, v6, v4);
        return v5(v8, v7);
    end;
end;