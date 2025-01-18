local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Dash_0 = require(l_script_FirstAncestor_0.Packages.Framework).Dash;
local l_append_0 = l_Dash_0.append;
local _ = l_Dash_0.join;
local _ = l_Dash_0.keys;
local l_map_0 = l_Dash_0.map;
local _ = l_Dash_0.pretty;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v8 = require(l_Util_0.ScriptReplacement);
local v9 = require(l_Util_0.ScriptAnalysis.R6Info);
local v10 = require(l_Util_0.ScriptAnalysis.Constants);
local v11 = require(script.Parent.Sort);
local v12 = {
    [v9.PartKey] = "Part", 
    [v10.ReferenceKey] = "Variable", 
    [v9.JointKey] = "Joint"
};
local v13 = {};
local function v21(v14, v15) --[[ Line: 45 ]] --[[ Name: getR15Schema ]]
    -- upvalues: v9 (copy), l_append_0 (copy), v8 (copy), l_map_0 (copy)
    local l_issueType_0 = v14.issueType;
    local l_instanceName_0 = v14.instanceName;
    local v18 = nil;
    if l_issueType_0 == v9.PartKey then
        v18 = v9.Conversions[v9.PartsKey][l_instanceName_0];
    elseif l_issueType_0 == v9.JointKey then
        v18 = {
            v9.Conversions[v9.JointsKey][l_instanceName_0][v9.JointKey]
        };
    else
        return nil;
    end;
    local v20 = l_append_0({
        {
            Id = v8.UNASSIGNED, 
            Label = v15:getText("ScriptPane", v8.UNASSIGNED)
        }
    }, l_map_0(v18, function(v19) --[[ Line: 67 ]]
        return {
            Id = v19, 
            Label = v19
        };
    end));
    return {
        Type = "Dropdown", 
        Options = v20
    };
end;
v13.isDiagnosticFilteredOut = function(v22, v23, v24) --[[ Line: 81 ]] --[[ Name: isDiagnosticFilteredOut ]]
    if v24.scriptName and v24.scriptName ~= "" and string.find(v22, v24.scriptName) == nil then
        return true;
    elseif next(v24.rigFilters.R6) and not v24.rigFilters.R6[v23.instanceName] then
        return true;
    else
        if next(v24.rigFilters.R15) then
            if not v24.rigFilters.R15.Unassigned and not v23.resolution then
                return true;
            elseif not v24.rigFilters.R15.Assigned and v23.resolution then
                return true;
            end;
        end;
        return false;
    end;
end;
v13.makeItemId = function(v25, v26, v27, v28) --[[ Line: 107 ]] --[[ Name: makeItemId ]]
    local v29 = v25 .. "|" .. v26 .. "|" .. v27;
    if v28 then
        v29 = v29 .. "|" .. v28;
    end;
    return v29;
end;
v13.genSortItems = function(v30, v31) --[[ Line: 120 ]] --[[ Name: genSortItems ]]
    -- upvalues: v11 (copy)
    return function(v32, v33) --[[ Line: 121 ]]
        -- upvalues: v30 (copy), v31 (copy), v11 (ref)
        local v34 = typeof(v32[v30.Key]) == "table";
        local v35 = typeof(v33[v30.Key]) == "table";
        local v36 = if v34 then v32[v30.Key].Value else v32[v30.Key];
        local v37 = if v35 then v33[v30.Key].Value else v33[v30.Key];
        if v30.SortMethod then
            local v38 = v30.SortMethod(v36, v37, v31);
            if v38 ~= nil then
                return v38;
            end;
        elseif v36 ~= v37 then
            if v31 == Enum.SortDirection.Descending then
                return v36 < v37;
            else
                return v37 < v36;
            end;
        end;
        return v11.scriptLinkSort(v32.name.Value, v33.name.Value, Enum.SortDirection.Ascending);
    end;
end;
v13.generateTreeViewItems = function(v39, v40, v41, v42, v43) --[[ Line: 146 ]] --[[ Name: generateTreeViewItems ]]
    -- upvalues: v13 (copy), v9 (copy), v21 (copy), v12 (copy), v8 (copy)
    local v44 = {};
    local v45 = {};
    for v46, v47 in v39 do
        local v48 = v40:getScriptInstanceFromGUID(v46);
        local l_v48_FullName_0 = v48:GetFullName();
        for _, v51 in v47:Get() do
            if not v13.isDiagnosticFilteredOut(l_v48_FullName_0, v51, v41) then
                local l_instanceName_1 = v51.instanceName;
                local l_issueType_1 = v51.issueType;
                if l_issueType_1 ~= v9.AnimationKey then
                    if not v44[v46] then
                        v44[v46] = {};
                    end;
                    if not v44[v46][l_issueType_1] then
                        v44[v46][l_issueType_1] = {};
                    end;
                    local v54 = v44[v46][l_issueType_1][l_instanceName_1];
                    local v55 = v21(v51, v43);
                    local _, v57 = next(v42);
                    local v58 = v57 and (v57.issueType ~= l_issueType_1 or v57.instanceName ~= l_instanceName_1);
                    if v54 == nil then
                        v54 = {
                            select = {
                                Value = v42[v13.makeItemId(v46, l_issueType_1, l_instanceName_1)], 
                                Schema = {
                                    Type = "Checkbox"
                                }
                            }, 
                            name = {
                                Value = {
                                    Script = v48
                                }, 
                                Schema = {
                                    Type = "ScriptLink"
                                }
                            }, 
                            count = 0, 
                            issue = v12[l_issueType_1], 
                            r6 = l_instanceName_1, 
                            r15 = if v55 then {
                                Value = v51.resolution or v8.UNASSIGNED, 
                                Schema = v55
                            } else {
                                Value = ""
                            }, 
                            menu_status = {
                                Value = {
                                    Checked = true
                                }, 
                                Schema = {
                                    Type = "Status"
                                }
                            }, 
                            children = {}, 
                            Path = {
                                scriptId = v46, 
                                instanceName = l_instanceName_1, 
                                issueType = l_issueType_1
                            }, 
                            _id = v13.makeItemId(v46, l_issueType_1, l_instanceName_1), 
                            _disabled = v58
                        };
                        v54.Path.item = v54;
                        v44[v46][l_issueType_1][l_instanceName_1] = v54;
                        table.insert(v45, v54);
                    end;
                    local v59 = {
                        select = nil, 
                        name = {
                            Value = {
                                Script = v48, 
                                Range = v51.range
                            }, 
                            Schema = {
                                Type = "ScriptLink"
                            }
                        }, 
                        count = nil, 
                        issue = "", 
                        r6 = l_instanceName_1, 
                        r15 = if v55 then {
                            Value = v51.resolution or v8.UNASSIGNED, 
                            Schema = v55
                        } else {
                            Value = ""
                        }, 
                        menu_status = {
                            Value = {
                                Checked = v51.resolution ~= nil
                            }, 
                            Schema = {
                                Type = "Status"
                            }
                        }, 
                        Path = {
                            parent = v54, 
                            scriptId = v46, 
                            issueType = l_issueType_1, 
                            diagnostic = v51
                        }, 
                        _id = v13.makeItemId(v46, l_issueType_1, l_instanceName_1, v51.diagnosticId), 
                        _disabled = v58
                    };
                    if v54.r15 and v54.r15.Value and v51.resolution ~= v54.r15.Value then
                        v54.r15 = if v55 then {
                            Value = v8.UNASSIGNED, 
                            Schema = v55
                        } else nil;
                    end;
                    if v51.resolution == nil then
                        v54.menu_status.Value.Checked = false;
                    end;
                    v59.Path.item = v59;
                    table.insert(v54.children, v59);
                    v54.count = v54.count + 1;
                end;
            end;
        end;
    end;
    return v45;
end;
v13.getItemId = function(v60) --[[ Line: 285 ]] --[[ Name: getItemId ]]
    return v60._id;
end;
return v13;