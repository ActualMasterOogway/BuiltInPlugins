local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_inspect_0 = require(l_Parent_1.LuauPolyfill).util.inspect;
local _ = require(l_Parent_0.types);
concatRestArgs = function(v4) --[[ Line: 14 ]] --[[ Name: concatRestArgs ]]
    local v5 = "";
    if #v4 > 0 then
        v5 = " " .. table.concat(v4, " ");
    end;
    return v5;
end;
getFormattedValue = function(v6, v7) --[[ Line: 22 ]] --[[ Name: getFormattedValue ]]
    -- upvalues: l_inspect_0 (copy)
    if type(v6) == "string" then
        return v6;
    else
        return (l_inspect_0(v6, v7));
    end;
end;
format = function(...) --[[ Line: 26 ]] --[[ Name: format ]]
    return formatter(nil, ...);
end;
formatWithOptions = function(v8, v9, ...) --[[ Line: 30 ]] --[[ Name: formatWithOptions ]]
    return formatter(v8, v9, ...);
end;
formatter = function(v10, v11, ...) --[[ Line: 34 ]] --[[ Name: formatter ]]
    -- upvalues: l_inspect_0 (copy)
    local v12 = {
        ...
    };
    local v13 = {};
    local v14 = {};
    if type(v11) == "string" then
        local _, v16 = v11:gsub("%%[sdj%%]", "");
        for v17, v18 in pairs(v12) do
            local v19 = getFormattedValue(v18, v10);
            if v17 <= v16 then
                table.insert(v13, v19);
            else
                table.insert(v14, v19);
            end;
        end;
    else
        v11 = l_inspect_0(v11, v10);
        for _, v21 in pairs(v12) do
            table.insert(v14, getFormattedValue(v21, v10));
        end;
    end;
    return string.format(v11, table.unpack(v13)) .. concatRestArgs(v14);
end;
return {
    format = format, 
    formatWithOptions = formatWithOptions, 
    concatRestArgs = concatRestArgs
};