local v0 = true;
local v1 = {};
local v2 = {};
local function _(v3, v4) --[[ Line: 24 ]] --[[ Name: indent ]]
    local v5 = ("\t"):rep(v4);
    return v5 .. v3:gsub("\n", "\n" .. v5);
end;
local function v13(v7, v8) --[[ Line: 34 ]] --[[ Name: indentLines ]]
    local v9 = {};
    for _, v11 in ipairs(v7) do
        local v12 = ("\t"):rep(v8);
        table.insert(v9, v12 .. v11:gsub("\n", "\n" .. v12));
    end;
    return table.concat(v9, "\n");
end;
local v19 = {
    __tostring = function(v14) --[[ Line: 50 ]] --[[ Name: __tostring ]]
        -- upvalues: v13 (copy)
        local v15 = {
            "LogInfo {"
        };
        local v16 = #v14.errors;
        local v17 = #v14.warnings;
        local v18 = #v14.infos;
        if v16 + v17 + v18 == 0 then
            table.insert(v15, "\t(no messages)");
        end;
        if v16 > 0 then
            table.insert(v15, ("\tErrors (%d) {"):format(v16));
            table.insert(v15, v13(v14.errors, 2));
            table.insert(v15, "\t}");
        end;
        if v17 > 0 then
            table.insert(v15, ("\tWarnings (%d) {"):format(v17));
            table.insert(v15, v13(v14.warnings, 2));
            table.insert(v15, "\t}");
        end;
        if v18 > 0 then
            table.insert(v15, ("\tInfos (%d) {"):format(v18));
            table.insert(v15, v13(v14.infos, 2));
            table.insert(v15, "\t}");
        end;
        table.insert(v15, "}");
        return table.concat(v15, "\n");
    end
};
local function v21() --[[ Line: 84 ]] --[[ Name: createLogInfo ]]
    -- upvalues: v19 (copy)
    local v20 = {
        errors = {}, 
        warnings = {}, 
        infos = {}
    };
    setmetatable(v20, v19);
    return v20;
end;
local v34 = {
    capture = function(v22) --[[ Line: 105 ]] --[[ Name: capture ]]
        -- upvalues: v21 (copy), v0 (ref), v1 (copy)
        local v23 = v21();
        local l_v0_0 = v0;
        v0 = false;
        v1[v23] = true;
        local l_status_0, l_result_0 = pcall(v22);
        v1[v23] = nil;
        v0 = l_v0_0;
        assert(l_status_0, l_result_0);
        return v23;
    end, 
    warn = function(v27, ...) --[[ Line: 125 ]] --[[ Name: warn ]]
        -- upvalues: v1 (copy), v0 (ref)
        local v28 = v27:format(...);
        for v29 in pairs(v1) do
            table.insert(v29.warnings, v28);
        end;
        local v30 = debug.traceback("", 2):sub(2);
        local v31 = "%s\n%s";
        local l_v28_0 = v28;
        local v33 = ("\t"):rep(1);
        v31 = v31:format(l_v28_0, v33 .. v30:gsub("\n", "\n" .. v33));
        if v0 then
            warn(v31);
        end;
    end
};
v34.warnOnce = function(v35, ...) --[[ Line: 148 ]] --[[ Name: warnOnce ]]
    -- upvalues: v2 (copy), v34 (copy)
    local v36 = debug.traceback();
    if v2[v36] then
        return;
    else
        v2[v36] = true;
        v34.warn(v35, ...);
        return;
    end;
end;
return v34;