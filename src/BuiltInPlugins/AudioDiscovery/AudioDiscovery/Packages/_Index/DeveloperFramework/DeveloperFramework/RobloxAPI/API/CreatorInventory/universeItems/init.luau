local v0 = game:DefineFastFlag("DevFrameworkFixFetchUniverseAssets", false);
return function(v1, v2) --[[ Line: 15 ]]
    -- upvalues: v0 (copy)
    return function(v3, v4) --[[ Line: 16 ]]
        -- upvalues: v0 (ref), v2 (copy), v1 (copy)
        assert(type(v3) == "number", (("universeId must be number, received %*"):format((type(v3)))));
        local v5 = nil;
        v5 = if v0 then v2.composeUrl(v2.APIS_URL, ("creator-inventory-api/v1/universes/%*/creator-inventory-items"):format(v3), v4) else v2.composeUrl(v2.APIS_URL, ("creator-inventory-api/v1/universe/%*/creator-inventory-items"):format(v3), v4);
        return {
            getUrl = function() --[[ Line: 35 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (ref)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 39 ]] --[[ Name: makeRequest ]]
                -- upvalues: v1 (ref), v5 (ref)
                local v6 = v1:get(v5);
                local v7 = v1:handleRetry(v6);
                return v1:parseJson(v7);
            end
        };
    end;
end;