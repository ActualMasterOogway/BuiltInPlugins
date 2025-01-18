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
local v11 = require(l_Parent_1.PrettyFormat);
local _ = require(l_Parent_0.PrettyFormat);
local l_format_0 = v11.format;
local l_getSerializers_0 = require(l_Parent_0.plugins).getSerializers;
local _ = require(l_Parent_0.types);
local v16 = nil;
local v17 = nil;
local function _() --[[ Line: 62 ]] --[[ Name: writeSnapshotVersion ]]
    return "-- Jest Roblox Snapshot v" .. "1" .. ", " .. "http://roblox.github.io/jest-roblox/snapshot-testing";
end;
local function _(v19) --[[ Line: 113 ]] --[[ Name: isObject ]]
    -- upvalues: l_Array_0 (copy)
    return v19 and typeof(v19) == "table" and not l_Array_0.isArray(v19);
end;
local function v23(v21, v22) --[[ Line: 117 ]] --[[ Name: testNameToKey ]]
    return v21 .. " " .. v22;
end;
local function v25(v24) --[[ Line: 121 ]] --[[ Name: keyToTestName ]]
    -- upvalues: l_Error_0 (copy)
    if not v24:match(" %d+$") then
        error(l_Error_0("Snapshot keys must end with a number."));
    end;
    return v24:gsub(" %d+$", "");
end;
local function v31(v26, v27) --[[ Line: 129 ]] --[[ Name: getSnapshotData ]]
    local v28 = {};
    local v29 = false;
    pcall(function() --[[ Line: 137 ]]
        -- upvalues: v28 (ref), v26 (copy)
        v28 = require(v26);
    end);
    local v30 = true;
    if v27 ~= "all" then
        v30 = v27 == "new";
    end;
    return {
        data = v28, 
        dirty = v29
    };
end;
local function v33(v32) --[[ Line: 161 ]] --[[ Name: addExtraLineBreaks ]]
    if v32:match("\n") then
        return "\n" .. v32 .. "\n";
    else
        return v32;
    end;
end;
local function v35(v34) --[[ Line: 172 ]] --[[ Name: removeExtraLineBreaks ]]
    -- upvalues: l_String_0 (copy)
    if v34:len() > 2 and l_String_0.startsWith(v34, "\n") and l_String_0.endsWith(v34, "\n") then
        return v34:sub(2, -2);
    else
        return v34;
    end;
end;
local function v40(v36, v37, v38) --[[ Line: 183 ]] --[[ Name: serialize ]]
    -- upvalues: v16 (ref), l_format_0 (copy), l_Object_0 (copy), l_getSerializers_0 (copy)
    v37 = v37 or 2;
    local v39 = v38 or {};
    return v16(l_format_0(v36, l_Object_0.assign({
        escapeRegex = true, 
        indent = v37, 
        plugins = l_getSerializers_0(), 
        printFunctionName = false
    }, v39)));
end;
local function v42(v41) --[[ Line: 197 ]] --[[ Name: minify ]]
    -- upvalues: l_format_0 (copy), l_getSerializers_0 (copy)
    return l_format_0(v41, {
        escapeRegex = true, 
        min = true, 
        plugins = l_getSerializers_0(), 
        printFunctionName = false
    });
end;
local function v44(v43) --[[ Line: 207 ]] --[[ Name: deserializeString ]]
    v43 = string.sub(v43, 2, -2);
    v43 = string.gsub(v43, "\\\\", "\\");
    return (string.gsub(v43, "\\\"", "\""));
end;
local function v46(v45) --[[ Line: 216 ]] --[[ Name: escapeBacktickString ]]
    return v45;
end;
local function _(v47) --[[ Line: 221 ]] --[[ Name: printBacktickString ]]
    return "[=[\n" .. v47 .. "]=]";
end;
local function v54(v49) --[[ Line: 225 ]] --[[ Name: ensureDirectoryExists ]]
    -- upvalues: v5 (ref)
    local v50 = v49:split("/");
    v50 = table.pack(table.unpack(v50, 1, #v50 - 1));
    local v51 = table.concat(v50, "/");
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 230 ]]
        -- upvalues: v5 (ref), v51 (copy)
        if not v5:Exists(v51) then
            v5:CreateDirectories(v51);
        end;
    end);
    if not l_status_1 and l_result_1:find("Error%(13%): Access Denied%. Path is outside of sandbox%.") then
        error("Provided path is invalid: you likely need to provide a different argument to --fs.readwrite.\n" .. "You may need to pass in `--fs.readwrite=$PWD`");
    end;
end;
v16 = function(v55) --[[ Line: 244 ]] --[[ Name: normalizeNewLines ]]
    v55 = string.gsub(v55, "\r\n", "\n");
    return (string.gsub(v55, "\r", "\n"));
end;
local function _(v56) --[[ Line: 252 ]] --[[ Name: alphanumsort ]]
    local function v58(v57) --[[ Line: 253 ]] --[[ Name: padnum ]]
        return ("%03d%s"):format(string.len(v57), v57);
    end;
    table.sort(v56, function(v59, v60) --[[ Line: 256 ]]
        -- upvalues: v58 (copy)
        return tostring(v59):gsub("%d+", v58) < tostring(v60):gsub("%d+", v58);
    end);
    return v56;
end;
local function v75(v62, v63) --[[ Line: 263 ]] --[[ Name: saveSnapshotFile ]]
    -- upvalues: l_Object_0 (copy), v16 (ref), v5 (ref), l_Error_0 (copy), v54 (copy)
    local v64 = {
        "-- Jest Roblox Snapshot v" .. "1" .. ", " .. "http://roblox.github.io/jest-roblox/snapshot-testing", 
        "local exports = {}"
    };
    local l_ipairs_0 = ipairs;
    local v66 = l_Object_0.keys(v62);
    local function v68(v67) --[[ Line: 253 ]] --[[ Name: padnum ]]
        return ("%03d%s"):format(string.len(v67), v67);
    end;
    local l_v68_0 = v68 --[[ copy: 7 -> 8 ]];
    table.sort(v66, function(v70, v71) --[[ Line: 256 ]]
        -- upvalues: l_v68_0 (copy)
        return tostring(v70):gsub("%d+", l_v68_0) < tostring(v71):gsub("%d+", l_v68_0);
    end);
    for _, v73 in l_ipairs_0(v66) do
        table.insert(v64, "exports[ [=[" .. v73 .. "]=] ] = " .. "[=[\n" .. v16(v62[v73]) .. "]=]");
    end;
    table.insert(v64, "return exports");
    if v5 == nil then
        local v74;
        v74, v66 = pcall(function() --[[ Line: 17 ]]
            return game:GetService("FileSystemService");
        end);
        v5 = v74 and v66 or nil or false;
    end;
    if not v5 then
        error(l_Error_0("Attempting to save snapshots in an environment where FileSystemService is inaccessible."));
    end;
    v54(v63);
    v5:WriteFile(v63, table.concat(v64, "\n\n"));
end;
local function v76(v77, v78) --[[ Line: 294 ]] --[[ Name: deepMergeArray ]]
    -- upvalues: l_Array_0 (copy), v76 (copy), v17 (ref)
    local v79 = l_Array_0.from(v77);
    for v80, v81 in ipairs(v78) do
        local v82 = v79[v80];
        if l_Array_0.isArray(v77[v80]) then
            v79[v80] = v76(v77[v80], v81);
        elseif v82 and typeof(v82) == "table" and not l_Array_0.isArray(v82) then
            v79[v80] = v17(v77[v80], v81);
        else
            v79[v80] = v81;
        end;
    end;
    return v79;
end;
v17 = function(v83, v84) --[[ Line: 313 ]] --[[ Name: deepMerge ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v17 (ref), v76 (copy)
    if v83 and typeof(v83) == "table" and not l_Array_0.isArray(v83) and v84 and typeof(v84) == "table" and not l_Array_0.isArray(v84) then
        local v85 = {};
        for v86, v87 in pairs(v83) do
            v85[v86] = v87;
        end;
        for v88, _ in pairs(v84) do
            local v90 = v84[v88];
            if v90 and typeof(v90) == "table" and not l_Array_0.isArray(v90) and not v84[v88]["$$typeof"] then
                if not v83[v88] then
                    l_Object_0.assign(v85, {
                        [v88] = v84[v88]
                    });
                else
                    v85[v88] = v17(v83[v88], v84[v88]);
                end;
            elseif l_Array_0.isArray(v84[v88]) then
                v85[v88] = v76(v83[v88], v84[v88]);
            else
                l_Object_0.assign(v85, {
                    [v88] = v84[v88]
                });
            end;
        end;
        return v85;
    elseif l_Array_0.isArray(v83) and l_Array_0.isArray(v84) then
        return (v76(v83, v84));
    else
        return v83;
    end;
end;
return {
    testNameToKey = v23, 
    keyToTestName = v25, 
    getSnapshotData = v31, 
    addExtraLineBreaks = v33, 
    removeExtraLineBreaks = v35, 
    serialize = v40, 
    minify = v42, 
    deserializeString = v44, 
    escapeBacktickString = v46, 
    saveSnapshotFile = v75, 
    deepMerge = v17, 
    robloxGetParent = function(v91, v92) --[[ Line: 343 ]] --[[ Name: robloxGetParent ]]
        local v93 = v92 or 0;
        local v94 = string.sub(v91, 1, 1) == "/";
        local v95 = {};
        for v96 in string.gmatch(v91, "[^\\/][^\\/]*") do
            table.insert(v95, v96);
        end;
        if v93 > 0 then
            v95 = {
                table.unpack(v95, 1, #v95 - v93)
            };
        end;
        if v94 then
            return "/" .. table.concat(v95, "/");
        else
            return table.concat(v95, "\\");
        end;
    end
};