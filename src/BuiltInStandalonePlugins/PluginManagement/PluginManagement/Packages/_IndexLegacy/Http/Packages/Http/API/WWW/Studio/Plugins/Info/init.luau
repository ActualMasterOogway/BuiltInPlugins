local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.BaseUrl);
return function(_) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 7 ]]
        -- upvalues: v1 (ref)
        assert(type(v3) == "string", "Expected assetId to be a string");
        local v4 = v1.makeQueryString({
            assetId = v3
        });
        return string.format("%sstudio/plugins/info?%s", v1.BASE_URL, v4);
    end;
end;