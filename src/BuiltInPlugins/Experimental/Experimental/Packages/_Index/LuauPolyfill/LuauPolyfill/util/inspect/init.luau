local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Array);
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local function v8(v7) --[[ Line: 23 ]] --[[ Name: inspect ]]
    -- upvalues: v2 (ref)
    return v2(v7, {});
end;
local function _(v9, v10) --[[ Line: 27 ]] --[[ Name: isIndexKey ]]
    local v11 = false;
    if type(v9) == "number" then
        v11 = false;
        if v9 <= v10 then
            v11 = false;
            if v9 >= 1 then
                v11 = math.floor(v9) == v9;
            end;
        end;
    end;
    return v11;
end;
local function _(v13) --[[ Line: 34 ]] --[[ Name: getTableLength ]]
    local v14 = 1;
    local v15 = rawget(v13, v14);
    while v15 ~= nil do
        v14 = v14 + 1;
        v15 = rawget(v13, v14);
    end;
    return v14 - 1;
end;
local function v21(v17, v18) --[[ Line: 44 ]] --[[ Name: sortKeysForPrinting ]]
    local v19 = type(v17);
    local v20 = type(v18);
    if v19 == v20 and (v19 == "number" or v19 == "string") then
        return v17 < v18;
    else
        return v19 < v20;
    end;
end;
local function _(v22) --[[ Line: 57 ]] --[[ Name: rawpairs ]]
    return next, v22, nil;
end;
local function v33(v24) --[[ Line: 61 ]] --[[ Name: getFragmentedKeys ]]
    -- upvalues: v21 (copy)
    local v25 = {};
    local v26 = 0;
    local v27 = 1;
    local v28 = rawget(v24, v27);
    while v28 ~= nil do
        v27 = v27 + 1;
        v28 = rawget(v24, v27);
    end;
    local v29 = v27 - 1;
    for v30, _ in next, v24 do
        local v32 = false;
        if type(v30) == "number" then
            v32 = false;
            if v30 <= v29 then
                v32 = false;
                if v30 >= 1 then
                    v32 = math.floor(v30) == v30;
                end;
            end;
        end;
        if not v32 then
            v26 = v26 + 1;
            v25[v26] = v30;
        end;
    end;
    table.sort(v25, v21);
    return v25, v26, v29;
end;
v2 = function(v34, v35) --[[ Line: 75 ]] --[[ Name: formatValue ]]
    -- upvalues: l_HttpService_0 (copy), v3 (ref)
    local v36 = typeof(v34);
    if v36 == "string" then
        return l_HttpService_0:JSONEncode(v34);
    elseif v36 == "number" then
        if v34 ~= v34 then
            return "NaN";
        elseif v34 == 1e999 then
            return "Infinity";
        elseif v34 == -1e999 then
            return "-Infinity";
        else
            return (tostring(v34));
        end;
    elseif v36 == "function" then
        local v37 = "[function";
        local v38 = debug.info(v34, "n");
        if v38 ~= nil and v38 ~= "" then
            v37 = v37 .. " " .. v38;
        end;
        return v37 .. "]";
    elseif v36 == "table" then
        return v3(v34, v35);
    else
        return (tostring(v34));
    end;
end;
v3 = function(v39, v40) --[[ Line: 108 ]] --[[ Name: formatObjectValue ]]
    -- upvalues: v2 (ref), v1 (copy), v4 (ref), v5 (ref)
    if table.find(v40, v39) ~= nil then
        return "[Circular]";
    else
        local v41 = {
            unpack(v40)
        };
        table.insert(v41, v39);
        if typeof(v39.toJSON) == "function" then
            local v42 = v39:toJSON(v39);
            if v42 ~= v39 then
                if typeof(v42) == "string" then
                    return v42;
                else
                    return v2(v42, v41);
                end;
            end;
        elseif v1.isArray(v39) then
            return v4(v39, v41);
        end;
        return v5(v39, v41);
    end;
end;
v5 = function(v43, v44) --[[ Line: 133 ]] --[[ Name: formatObject ]]
    -- upvalues: v33 (copy), v6 (ref), v2 (ref)
    local v45 = "";
    local v46 = getmetatable(v43);
    if v46 and rawget(v46, "__tostring") then
        return (tostring(v43));
    else
        local v47, v48, v49 = v33(v43);
        if v49 == 0 and v48 == 0 then
            return v45 .. "{}";
        elseif #v44 > 2 then
            return v45 .. "[" .. v6(v43) .. "]";
        else
            local v50 = {};
            for v51 = 1, v49 do
                table.insert(v50, (v2(v43[v51], v44)));
            end;
            for v52 = 1, v48 do
                local v53 = v47[v52];
                table.insert(v50, v53 .. ": " .. v2(v43[v53], v44));
            end;
            return v45 .. "{ " .. table.concat(v50, ", ") .. " }";
        end;
    end;
end;
v4 = function(v54, v55) --[[ Line: 169 ]] --[[ Name: formatArray ]]
    -- upvalues: v2 (ref)
    local v56 = #v54;
    if v56 == 0 then
        return "[]";
    elseif #v55 > 2 then
        return "[Array]";
    else
        local v57 = math.min(10, v56);
        local v58 = v56 - v57;
        local v59 = {};
        for v60 = 1, v57 do
            v59[v60] = v2(v54[v60], v55);
        end;
        if v58 == 1 then
            table.insert(v59, "... 1 more item");
        elseif v58 > 1 then
            table.insert(v59, ("... %s more items"):format((tostring(v58))));
        end;
        return "[" .. table.concat(v59, ", ") .. "]";
    end;
end;
v6 = function(_) --[[ Line: 195 ]] --[[ Name: getObjectTag ]]
    return "Object";
end;
return v8;