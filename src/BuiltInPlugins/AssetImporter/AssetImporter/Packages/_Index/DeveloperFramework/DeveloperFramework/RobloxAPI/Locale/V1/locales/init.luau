return function(v0, v1) --[[ Line: 37 ]]
    return function(v2) --[[ Line: 39 ]]
        -- upvalues: v1 (copy), v0 (copy)
        if v2 then
            assert(type(v2) == "string", string.format("localeCode must be string, received %s", (type(v2))));
        end;
        local v3 = false;
        if v2 ~= nil then
            v3 = {
                displayValueLocaleCode = v2
            };
        end;
        local v4 = v1.composeUrl(v1.LOCALE_URL, "v1/locales", v3);
        return {
            getUrl = function() --[[ Line: 51 ]] --[[ Name: getUrl ]]
                -- upvalues: v4 (copy)
                return v4;
            end, 
            makeRequest = function() --[[ Line: 55 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v4 (copy)
                local v5 = v0:get(v4);
                return v0:parseJson(v5);
            end
        };
    end;
end;