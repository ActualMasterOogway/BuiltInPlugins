local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local function _() --[[ Line: 16 ]] --[[ Name: getFileSystemService ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
        return game:GetService("FileSystemService");
    end);
    return l_status_0 and l_result_0 or nil;
end;
local v5 = nil;
local v6 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v6.Array;
local l_Error_0 = v6.Error;
local l_Object_0 = v6.Object;
local l_String_0 = v6.String;
local l_prettyFormat_0 = require(l_Parent_1.PrettyFormat).prettyFormat;
local l_getSerializers_0 = require(l_Parent_0.plugins).getSerializers;
local _ = require(l_Parent_0.types);
local v14 = nil;
local v15 = nil;
local function _() --[[ Line: 56 ]] --[[ Name: writeSnapshotVersion ]]
    return "-- Jest Roblox Snapshot v" .. "1" .. ", " .. "http://roblox.github.io/jest-roblox/snapshot-testing";
end;
local function _(v17) --[[ Line: 107 ]] --[[ Name: isObject ]]
    -- upvalues: l_Array_0 (copy)
    return v17 and typeof(v17) == "table" and not l_Array_0.isArray(v17);
end;
local function v21(v19, v20) --[[ Line: 111 ]] --[[ Name: testNameToKey ]]
    return v19 .. " " .. v20;
end;
local function v23(v22) --[[ Line: 115 ]] --[[ Name: keyToTestName ]]
    -- upvalues: l_Error_0 (copy)
    if not v22:match(" %d+$") then
        error(l_Error_0("Snapshot keys must end with a number."));
    end;
    return v22:gsub(" %d+$", "");
end;
local function v29(v24, v25) --[[ Line: 123 ]] --[[ Name: getSnapshotData ]]
    local v26 = {};
    local v27 = false;
    pcall(function() --[[ Line: 132 ]]
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
local function v31(v30) --[[ Line: 157 ]] --[[ Name: addExtraLineBreaks ]]
    if v30:match("\n") then
        return "\n" .. v30 .. "\n";
    else
        return v30;
    end;
end;
local function v33(v32) --[[ Line: 168 ]] --[[ Name: removeExtraLineBreaks ]]
    -- upvalues: l_String_0 (copy)
    if v32:len() > 2 and l_String_0.startsWith(v32, "\n") and l_String_0.endsWith(v32, "\n") then
        return v32:sub(2, -2);
    else
        return v32;
    end;
end;
local function v36(v34, v35) --[[ Line: 179 ]] --[[ Name: serialize ]]
    -- upvalues: v14 (ref), l_prettyFormat_0 (copy), l_getSerializers_0 (copy)
    v35 = v35 or 2;
    return v14(l_prettyFormat_0(v34, {
        escapeRegex = true, 
        indent = v35, 
        plugins = l_getSerializers_0(), 
        printFunctionName = false
    }));
end;
local function v38(v37) --[[ Line: 191 ]] --[[ Name: minify ]]
    -- upvalues: l_prettyFormat_0 (copy), l_getSerializers_0 (copy)
    return l_prettyFormat_0(v37, {
        escapeRegex = true, 
        min = true, 
        plugins = l_getSerializers_0(), 
        printFunctionName = false
    });
end;
local function v40(v39) --[[ Line: 201 ]] --[[ Name: deserializeString ]]
    v39 = string.sub(v39, 2, -2);
    v39 = string.gsub(v39, "\\\\", "\\");
    return (string.gsub(v39, "\\\"", "\""));
end;
local function v42(v41) --[[ Line: 210 ]] --[[ Name: escapeBacktickString ]]
    return v41;
end;
local function _(v43) --[[ Line: 215 ]] --[[ Name: printBacktickString ]]
    return "[=[\n" .. v43 .. "]=]";
end;
local function v49(v45) --[[ Line: 219 ]] --[[ Name: ensureDirectoryExists ]]
    -- upvalues: v5 (ref)
    local v46 = v45:split("/");
    v46 = table.pack(table.unpack(v46, 1, #v46 - 1));
    v46 = table.concat(v46, "/");
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 224 ]]
        -- upvalues: v5 (ref), v46 (ref)
        if not v5:Exists(v46) then
            v5:CreateDirectories(v46);
        end;
    end);
    if not l_status_1 and l_result_1:find("Error%(13%): Access Denied%. Path is outside of sandbox%.") then
        error("Provided path is invalid: you likely need to provide a different argument to --fs.readwrite.\n" .. "You may need to pass in `--fs.readwrite=$PWD`");
    end;
end;
v14 = function(v50) --[[ Line: 238 ]] --[[ Name: normalizeNewLines ]]
    v50 = string.gsub(v50, "\r\n", "\n");
    return string.gsub(v50, "\r", "\n");
end;
local function _(v51) --[[ Line: 245 ]] --[[ Name: alphanumsort ]]
    local function v53(v52) --[[ Line: 246 ]] --[[ Name: padnum ]]
        return ("%03d%s"):format(#v52, v52);
    end;
    table.sort(v51, function(v54, v55) --[[ Line: 247 ]]
        -- upvalues: v53 (copy)
        return tostring(v54):gsub("%d+", v53) < tostring(v55):gsub("%d+", v53);
    end);
    return v51;
end;
local function v70(v57, v58) --[[ Line: 253 ]] --[[ Name: saveSnapshotFile ]]
    -- upvalues: l_Object_0 (copy), v14 (ref), v5 (ref), l_Error_0 (copy), v49 (copy)
    local v59 = {
        "-- Jest Roblox Snapshot v" .. "1" .. ", " .. "http://roblox.github.io/jest-roblox/snapshot-testing", 
        "local exports = {}"
    };
    local l_ipairs_0 = ipairs;
    local v61 = l_Object_0.keys(v57);
    local function v63(v62) --[[ Line: 246 ]] --[[ Name: padnum ]]
        return ("%03d%s"):format(#v62, v62);
    end;
    local l_v63_0 = v63 --[[ copy: 7 -> 8 ]];
    table.sort(v61, function(v65, v66) --[[ Line: 247 ]]
        -- upvalues: l_v63_0 (copy)
        return tostring(v65):gsub("%d+", l_v63_0) < tostring(v66):gsub("%d+", l_v63_0);
    end);
    for _, v68 in l_ipairs_0(v61) do
        table.insert(v59, "exports[ [=[" .. v68 .. "]=] ] = " .. "[=[\n" .. v14(v57[v68]) .. "]=]");
    end;
    table.insert(v59, "return exports");
    if v5 == nil then
        local v69;
        v69, v61 = pcall(function() --[[ Line: 17 ]]
            return game:GetService("FileSystemService");
        end);
        v5 = v69 and v61 or nil or false;
    end;
    if not v5 then
        error(l_Error_0("Attempting to save snapshots in an environment where FileSystemService is inaccessible."));
    end;
    v49(v58);
    v5:WriteFile(v58, table.concat(v59, "\n\n"));
end;
local function v71(v72, v73) --[[ Line: 287 ]] --[[ Name: deepMergeArray ]]
    -- upvalues: l_Array_0 (copy), v71 (copy), v15 (ref)
    local v74 = l_Array_0.from(v72);
    for v75, v76 in ipairs(v73) do
        local v77 = v74[v75];
        if l_Array_0.isArray(v72[v75]) then
            v74[v75] = v71(v72[v75], v76);
        elseif v77 and typeof(v77) == "table" and not l_Array_0.isArray(v77) then
            v74[v75] = v15(v72[v75], v76);
        else
            v74[v75] = v76;
        end;
    end;
    return v74;
end;
v15 = function(v78, v79) --[[ Line: 309 ]] --[[ Name: deepMerge ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v15 (ref), v71 (copy)
    if v78 and typeof(v78) == "table" and not l_Array_0.isArray(v78) and v79 and typeof(v79) == "table" and not l_Array_0.isArray(v79) then
        local v80 = {};
        for v81, v82 in pairs(v78) do
            v80[v81] = v82;
        end;
        for v83, _ in pairs(v79) do
            local v85 = v79[v83];
            if v85 and typeof(v85) == "table" and not l_Array_0.isArray(v85) and not v79[v83]["$$typeof"] then
                if not v78[v83] then
                    l_Object_0.assign(v80, {
                        [v83] = v79[v83]
                    });
                else
                    v80[v83] = v15(v78[v83], v79[v83]);
                end;
            elseif l_Array_0.isArray(v79[v83]) then
                v80[v83] = v71(v78[v83], v79[v83]);
            else
                l_Object_0.assign(v80, {
                    [v83] = v79[v83]
                });
            end;
        end;
        return v80;
    elseif l_Array_0.isArray(v78) and l_Array_0.isArray(v79) then
        return (v71(v78, v79));
    else
        return v78;
    end;
end;
return {
    testNameToKey = v21, 
    keyToTestName = v23, 
    getSnapshotData = v29, 
    addExtraLineBreaks = v31, 
    removeExtraLineBreaks = v33, 
    serialize = v36, 
    minify = v38, 
    deserializeString = v40, 
    escapeBacktickString = v42, 
    saveSnapshotFile = v70, 
    deepMerge = v15, 
    robloxGetParent = function(v86, v87) --[[ Line: 339 ]] --[[ Name: robloxGetParent ]]
        v87 = v87 or 0;
        local v88 = string.sub(v86, 1, 1) == "/";
        local v89 = {};
        for v90 in string.gmatch(v86, "[^\\/][^\\/]*") do
            table.insert(v89, v90);
        end;
        if v87 > 0 then
            v89 = {
                table.unpack(v89, 1, #v89 - v87)
            };
        end;
        if v88 then
            return "/" .. table.concat(v89, "/");
        else
            return table.concat(v89, "\\");
        end;
    end
};