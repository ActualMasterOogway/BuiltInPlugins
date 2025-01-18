local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.BaseUrl);
local v2 = require(l_Parent_0.Networking);
return function(v3) --[[ Line: 40 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 41 ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref)
        assert(type(v4) == "table", "Expected an array of pluginIds.");
        assert(#v4 > 0, "Expected a list of plugins to fetch data for.");
        if #v4 > 100 then
            warn("Requesting more than 100 plugins at a time is likely to cause problems.");
        end;
        local v5 = v1.makeQueryString({
            pluginIds = table.concat(v4, ",")
        });
        local v6 = string.format("%sstudio-plugin-api/v1/plugins?%s", v1.APIS_URL, v5);
        local v7 = v3:get(v6);
        local v8 = v3:handleRetry(v7);
        return v2.parseJson(v8);
    end;
end;