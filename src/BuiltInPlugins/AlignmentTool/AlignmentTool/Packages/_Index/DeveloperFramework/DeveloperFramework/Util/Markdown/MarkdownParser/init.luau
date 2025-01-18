local v0 = require(script.Parent.BuildTree);
local v1 = require(script.Parent.PostProcessTree);
local v2 = require(script.Parent.Tokenize);
local _ = require(script.Parent.Types);
local v4 = {};
v4.safeParse = function(v5) --[[ Line: 10 ]] --[[ Name: safeParse ]]
    -- upvalues: v4 (copy)
    local v7, v8 = xpcall(function() --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v5 (copy)
        return v4.parse(v5);
    end, function(v6) --[[ Line: 13 ]]
        return (("%*\n%*"):format(v6, (debug.traceback())));
    end);
    return v7, v8;
end;
v4.parse = function(v9) --[[ Line: 19 ]] --[[ Name: parse ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    local v10 = v2(v9);
    local v11 = v0(v10);
    v11.children = v1(v11);
    return v11;
end;
return v4;