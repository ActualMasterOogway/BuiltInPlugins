local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = {};
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local v6 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local l_pluralize_0 = require(l_Parent_1.JestUtil).pluralize;
local l_formatTestPath_0 = require(l_Parent_0.utils).formatTestPath;
local function v11(...) --[[ Line: 35 ]]
    -- upvalues: v6 (copy)
    return v6.bold(v6.red(...));
end;
local function v12(...) --[[ Line: 38 ]]
    -- upvalues: v6 (copy)
    return v6.bold(v6.yellow(...));
end;
local function v13(...) --[[ Line: 41 ]]
    -- upvalues: v6 (copy)
    return v6.bold(v6.green(...));
end;
local l_dim_0 = v6.dim;
local function v15(...) --[[ Line: 45 ]]
    -- upvalues: v6 (copy)
    return v6.bold(v6.green(...));
end;
local l_bold_0 = v6.bold;
local function v17(...) --[[ Line: 49 ]]
    -- upvalues: v6 (copy)
    return v6.bold(v6.green(...));
end;
v2.default = function(v18, v19, v20) --[[ Line: 54 ]]
    -- upvalues: l_bold_0 (copy), l_Boolean_0 (copy), v13 (copy), l_pluralize_0 (copy), v11 (copy), l_dim_0 (copy), v17 (copy), v15 (copy), v12 (copy), l_formatTestPath_0 (copy), l_Array_0 (copy)
    local v21 = {};
    table.insert(v21, l_bold_0("Snapshot Summary"));
    if l_Boolean_0.toJSBoolean(v18.added) then
        table.insert(v21, v13(" \226\128\186 " .. l_pluralize_0("snapshot", v18.added) .. " written ") .. "from " .. l_pluralize_0("test suite", v18.filesAdded) .. ".");
    end;
    if l_Boolean_0.toJSBoolean(v18.unmatched) then
        table.insert(v21, v11(" \226\128\186 " .. l_pluralize_0("snapshot", v18.unmatched) .. " failed") .. " from " .. l_pluralize_0("test suite", v18.filesUnmatched) .. ". " .. l_dim_0("Inspect your code changes or " .. v20 .. " to update them."));
    end;
    if l_Boolean_0.toJSBoolean(v18.updated) then
        table.insert(v21, v17(" \226\128\186 " .. l_pluralize_0("snapshot", v18.updated) .. " updated ") .. "from " .. l_pluralize_0("test suite", v18.filesUpdated) .. ".");
    end;
    if l_Boolean_0.toJSBoolean(v18.filesRemoved) then
        if v18.didUpdate then
            table.insert(v21, v15(" \226\128\186 " .. l_pluralize_0("snapshot file", v18.filesRemoved) .. " removed ") .. "from " .. l_pluralize_0("test suite", v18.filesRemoved) .. ".");
        else
            table.insert(v21, v12(" \226\128\186 " .. l_pluralize_0("snapshot file", v18.filesRemoved) .. " obsolete ") .. "from " .. l_pluralize_0("test suite", v18.filesRemoved) .. ". " .. l_dim_0("To remove " .. (v18.filesRemoved == 1 and "it" or "them all") .. ", " .. v20 .. "."));
        end;
    end;
    if v18.filesRemovedList and #v18.filesRemovedList > 0 then
        local v22 = v18.filesRemovedList[1];
        local v23 = table.pack(table.unpack(v18.filesRemovedList, 2));
        table.insert(v21, "  " .. " \226\134\179 " .. " " .. " \226\128\162 " .. l_formatTestPath_0(v19, v22));
        l_Array_0.forEach(v23, function(v24) --[[ Line: 120 ]]
            -- upvalues: v21 (copy), l_formatTestPath_0 (ref), v19 (copy)
            table.insert(v21, "    " .. " \226\128\162 " .. l_formatTestPath_0(v19, v24));
        end);
    end;
    if l_Boolean_0.toJSBoolean(v18.unchecked) then
        if v18.didUpdate then
            table.insert(v21, v15(" \226\128\186 " .. l_pluralize_0("snapshot", v18.unchecked) .. " removed ") .. "from " .. l_pluralize_0("test suite", #v18.uncheckedKeysByFile) .. ".");
        else
            table.insert(v21, v12(" \226\128\186 " .. l_pluralize_0("snapshot", v18.unchecked) .. " obsolete ") .. "from " .. l_pluralize_0("test suite", #v18.uncheckedKeysByFile) .. ". " .. l_dim_0("To remove " .. (v18.unchecked == 1 and "it" or "them all") .. ", " .. v20 .. "."));
        end;
    end;
    l_Array_0.forEach(v18.uncheckedKeysByFile, function(v25) --[[ Line: 152 ]]
        -- upvalues: v21 (copy), l_formatTestPath_0 (ref), v19 (copy), l_Array_0 (ref)
        table.insert(v21, "  " .. " \226\134\179 " .. l_formatTestPath_0(v19, v25.filePath));
        l_Array_0.forEach(v25.keys, function(v26) --[[ Line: 155 ]]
            -- upvalues: v21 (ref)
            table.insert(v21, "    " .. " \226\128\162 " .. v26);
        end);
    end);
    return v21;
end;
return v2;