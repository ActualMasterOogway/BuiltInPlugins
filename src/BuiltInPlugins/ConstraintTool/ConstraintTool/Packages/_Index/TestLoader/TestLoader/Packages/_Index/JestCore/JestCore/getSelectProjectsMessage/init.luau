local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local v5 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.getProjectDisplayName).default;
local v8 = nil;
local v9 = nil;
local v10 = nil;
v4.default = function(v11, v12) --[[ Line: 28 ]] --[[ Name: getSelectProjectsMessage ]]
    -- upvalues: v8 (ref), v9 (ref)
    if #v11 == 0 then
        return v8(v12);
    else
        return v9(v11);
    end;
end;
v8 = function(v13) --[[ Line: 45 ]] --[[ Name: getNoSelectionWarning ]]
    -- upvalues: l_Boolean_0 (copy), v5 (copy)
    if l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v13.ignoreProjects) then v13.selectProjects else v13.ignoreProjects) then
        return v5.yellow("You provided values for --selectProjects and --ignoreProjects, but no projects were found matching the selection.\n" .. "Are you ignoring all the selected projects?\n");
    elseif l_Boolean_0.toJSBoolean(v13.ignoreProjects) then
        return v5.yellow("You provided values for --ignoreProjects, but no projects were found matching the selection.\n" .. "Are you ignoring all projects?\n");
    elseif l_Boolean_0.toJSBoolean(v13.selectProjects) then
        return v5.yellow("You provided values for --selectProjects but no projects were found matching the selection.\n");
    else
        return v5.yellow("No projects were found.\n");
    end;
end;
v9 = function(v14) --[[ Line: 72 ]] --[[ Name: getProjectsRunningMessage ]]
    -- upvalues: l_default_0 (copy), v5 (copy), l_Array_0 (copy), v10 (ref)
    if #v14 == 1 then
        local v15 = l_default_0(v14[1]);
        return ("Running one project: %s\n"):format(v5.bold(v15));
    else
        local v16 = l_Array_0.join(l_Array_0.sort(l_Array_0.map(v14, v10)), "\n");
        return ("Running %s projects:\n%s\n"):format(tostring(#v14), (tostring(v16)));
    end;
end;
v10 = function(v17) --[[ Line: 81 ]] --[[ Name: getProjectNameListElement ]]
    -- upvalues: l_default_0 (copy), l_Boolean_0 (copy), v5 (copy)
    local v18 = l_default_0(v17);
    return ("- %s"):format((tostring(if l_Boolean_0.toJSBoolean(v18) then v5.bold(v18) else "<unnamed project>")));
end;
return v4;