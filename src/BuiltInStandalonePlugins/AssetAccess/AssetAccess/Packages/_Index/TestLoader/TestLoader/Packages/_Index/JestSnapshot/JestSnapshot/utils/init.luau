local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.RobloxShared);
local v3 = v2.getDataModelService("FileSystemService");
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Error_0 = v4.Error;
local l_Object_0 = v4.Object;
local l_String_0 = v4.String;
local v9 = require(l_Parent_1.PrettyFormat);
local _ = require(l_Parent_0.PrettyFormat);
local l_format_0 = v9.format;
local l_getSerializers_0 = require(l_Parent_0.plugins).getSerializers;
local _ = require(l_Parent_0.types);
local v14 = nil;
local v15 = nil;
local function _() --[[ Line: 57 ]] --[[ Name: writeSnapshotVersion ]]
    return "-- Jest Roblox Snapshot v" .. "1" .. ", " .. "http://roblox.github.io/jest-roblox-internal/snapshot-testing";
end;
local function _(v17) --[[ Line: 108 ]] --[[ Name: isObject ]]
    -- upvalues: l_Array_0 (copy)
    return v17 and typeof(v17) == "table" and not l_Array_0.isArray(v17);
end;
local function v21(v19, v20) --[[ Line: 112 ]] --[[ Name: testNameToKey ]]
    return v19 .. " " .. v20;
end;
local function v23(v22) --[[ Line: 116 ]] --[[ Name: keyToTestName ]]
    -- upvalues: l_Error_0 (copy)
    if not v22:match(" %d+$") then
        error(l_Error_0("Snapshot keys must end with a number."));
    end;
    return v22:gsub(" %d+$", "");
end;
local function v29(v24, v25) --[[ Line: 124 ]] --[[ Name: getSnapshotData ]]
    local v26 = {};
    local v27 = false;
    pcall(function() --[[ Line: 134 ]]
        -- upvalues: v26 (ref), v24 (copy)
        v26 = require(v24);
    end);
    local v28 = true;
    if v25 ~= "all" then
        v28 = v25 == "new";
    end;
    return {
        data = v26, 
        dirty = v27
    };
end;
local function v31(v30) --[[ Line: 158 ]] --[[ Name: addExtraLineBreaks ]]
    if v30:match("\n") then
        return "\n" .. v30 .. "\n";
    else
        return v30;
    end;
end;
local function v33(v32) --[[ Line: 169 ]] --[[ Name: removeExtraLineBreaks ]]
    -- upvalues: l_String_0 (copy)
    if v32:len() > 2 and l_String_0.startsWith(v32, "\n") and l_String_0.endsWith(v32, "\n") then
        return v32:sub(2, -2);
    else
        return v32;
    end;
end;
local function v38(v34, v35, v36) --[[ Line: 180 ]] --[[ Name: serialize ]]
    -- upvalues: v14 (ref), l_format_0 (copy), l_Object_0 (copy), l_getSerializers_0 (copy)
    v35 = v35 or 2;
    local v37 = v36 or {};
    return v14(l_format_0(v34, l_Object_0.assign({
        escapeRegex = true, 
        indent = v35, 
        plugins = l_getSerializers_0(), 
        printFunctionName = false
    }, v37)));
end;
local function v40(v39) --[[ Line: 194 ]] --[[ Name: minify ]]
    -- upvalues: l_format_0 (copy), l_getSerializers_0 (copy)
    return l_format_0(v39, {
        escapeRegex = true, 
        min = true, 
        plugins = l_getSerializers_0(), 
        printFunctionName = false
    });
end;
local function v42(v41) --[[ Line: 204 ]] --[[ Name: deserializeString ]]
    v41 = string.sub(v41, 2, -2);
    v41 = string.gsub(v41, "\\\\", "\\");
    return (string.gsub(v41, "\\\"", "\""));
end;
local function v44(v43) --[[ Line: 213 ]] --[[ Name: escapeBacktickString ]]
    return v43;
end;
local function _(v45) --[[ Line: 218 ]] --[[ Name: printBacktickString ]]
    return "[=[\n" .. v45 .. "]=]";
end;
local l_ensureDirectoryExists_0 = v2.ensureDirectoryExists;
v14 = function(v48) --[[ Line: 225 ]] --[[ Name: normalizeNewLines ]]
    v48 = string.gsub(v48, "\r\n", "\n");
    return (string.gsub(v48, "\r", "\n"));
end;
local function _(v49) --[[ Line: 233 ]] --[[ Name: alphanumsort ]]
    local function v51(v50) --[[ Line: 234 ]] --[[ Name: padnum ]]
        return ("%03d%s"):format(string.len(v50), v50);
    end;
    table.sort(v49, function(v52, v53) --[[ Line: 237 ]]
        -- upvalues: v51 (copy)
        return tostring(v52):gsub("%d+", v51) < tostring(v53):gsub("%d+", v51);
    end);
    return v49;
end;
local function v67(v55, v56) --[[ Line: 244 ]] --[[ Name: saveSnapshotFile ]]
    -- upvalues: l_Object_0 (copy), v14 (ref), v3 (copy), l_Error_0 (copy), l_ensureDirectoryExists_0 (copy)
    local v57 = {
        "-- Jest Roblox Snapshot v" .. "1" .. ", " .. "http://roblox.github.io/jest-roblox-internal/snapshot-testing", 
        "local exports = {}"
    };
    local l_ipairs_0 = ipairs;
    local v59 = l_Object_0.keys(v55);
    local function v61(v60) --[[ Line: 234 ]] --[[ Name: padnum ]]
        return ("%03d%s"):format(string.len(v60), v60);
    end;
    local l_v61_0 = v61 --[[ copy: 7 -> 8 ]];
    table.sort(v59, function(v63, v64) --[[ Line: 237 ]]
        -- upvalues: l_v61_0 (copy)
        return tostring(v63):gsub("%d+", l_v61_0) < tostring(v64):gsub("%d+", l_v61_0);
    end);
    for _, v66 in l_ipairs_0(v59) do
        table.insert(v57, "exports[ [=[" .. v66 .. "]=] ] = " .. ("[=[\n" .. v14(v55[v66]) .. "]=]") .. "\n");
    end;
    table.insert(v57, "return exports");
    if not v3 then
        error(l_Error_0("Attempting to save snapshots in an environment where FileSystemService is inaccessible."));
    end;
    l_ensureDirectoryExists_0(v56);
    v3:WriteFile(v56, table.concat(v57, "\n") .. "\n");
end;
local function v68(v69, v70) --[[ Line: 273 ]] --[[ Name: deepMergeArray ]]
    -- upvalues: l_Array_0 (copy), v68 (copy), v15 (ref)
    local v71 = l_Array_0.from(v69);
    for v72, v73 in ipairs(v70) do
        local v74 = v71[v72];
        if l_Array_0.isArray(v69[v72]) then
            v71[v72] = v68(v69[v72], v73);
        elseif v74 and typeof(v74) == "table" and not l_Array_0.isArray(v74) then
            v71[v72] = v15(v69[v72], v73);
        else
            v71[v72] = v73;
        end;
    end;
    return v71;
end;
v15 = function(v75, v76) --[[ Line: 293 ]] --[[ Name: deepMerge ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v15 (ref), v68 (copy)
    if v75 and typeof(v75) == "table" and not l_Array_0.isArray(v75) and v76 and typeof(v76) == "table" and not l_Array_0.isArray(v76) then
        local v77 = table.clone(v75);
        for v78, _ in pairs(v76) do
            local v80 = v76[v78];
            if v80 and typeof(v80) == "table" and not l_Array_0.isArray(v80) and not v76[v78]["$$typeof"] then
                if not v75[v78] then
                    l_Object_0.assign(v77, {
                        [v78] = v76[v78]
                    });
                else
                    v77[v78] = v15(v75[v78], v76[v78]);
                end;
            elseif l_Array_0.isArray(v76[v78]) then
                v77[v78] = v68(v75[v78], v76[v78]);
            else
                l_Object_0.assign(v77, {
                    [v78] = v76[v78]
                });
            end;
        end;
        return v77;
    elseif l_Array_0.isArray(v75) and l_Array_0.isArray(v76) then
        return (v68(v75, v76));
    else
        return v75;
    end;
end;
return {
    testNameToKey = v21, 
    keyToTestName = v23, 
    getSnapshotData = v29, 
    addExtraLineBreaks = v31, 
    removeExtraLineBreaks = v33, 
    serialize = v38, 
    minify = v40, 
    deserializeString = v42, 
    escapeBacktickString = v44, 
    saveSnapshotFile = v67, 
    deepMerge = v15
};