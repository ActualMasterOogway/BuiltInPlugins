local v0 = nil;
local function v6() --[[ Line: 13 ]] --[[ Name: getLookupTable ]]
    -- upvalues: v0 (ref)
    if v0 then
        return v0;
    else
        v0 = {};
        local v1 = require(script.Data);
        for _, v3 in pairs(v1) do
            for _, v5 in pairs(v3.items) do
                v0[v5.name] = v5;
            end;
        end;
        return v0;
    end;
end;
return {
    getNamedEmoji = function(v7) --[[ Line: 30 ]] --[[ Name: getNamedEmoji ]]
        -- upvalues: v6 (copy)
        local v8 = v6();
        if v8[v7] then
            return v8[v7].base;
        else
            local v9 = v7:match("[2-6]$");
            if v9 then
                v9 = tonumber(v9);
                v7 = v7:sub(1, -2);
                if v8[v7] and v8[v7].alts then
                    return v8[v7].alts[v9];
                end;
            end;
            return nil;
        end;
    end, 
    getCategories = function() --[[ Line: 50 ]] --[[ Name: getCategories ]]
        return require(script.Data);
    end
};