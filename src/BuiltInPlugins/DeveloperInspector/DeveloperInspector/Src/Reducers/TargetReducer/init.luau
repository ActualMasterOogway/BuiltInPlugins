local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_None_0 = v2.None;
local l_join_0 = v2.join;
local l_joinDeep_0 = v2.joinDeep;
local l_collect_0 = v2.collect;
local l_values_0 = v2.values;
local l_sort_0 = table.sort;
local l_Util_0 = l_Parent_0.Src.Util;
local v10 = require(l_Util_0.TabIds);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v12 = require(l_Actions_0.SetTab);
local v13 = require(l_Actions_0.AddTargets);
local v14 = require(l_Actions_0.ClearTargets);
local v15 = require(l_Actions_0.CloseTarget);
local v16 = require(l_Actions_0.SelectTarget);
local v17 = require(l_Actions_0.ToggleTarget);
local function v19(v18) --[[ Line: 27 ]] --[[ Name: getDebugId ]]
    return v18.Id or v18.Name;
end;
local function v24(v20) --[[ Line: 31 ]] --[[ Name: getChildren ]]
    -- upvalues: l_values_0 (copy), l_sort_0 (copy)
    local v21 = l_values_0(v20.Children);
    l_sort_0(v21, function(v22, v23) --[[ Line: 33 ]]
        return v22.Name > v23.Name;
    end);
    return v21;
end;
local function _(v25, v26, v27) --[[ Line: 39 ]] --[[ Name: createItem ]]
    -- upvalues: v24 (copy), v19 (copy)
    return {
        Name = v25, 
        ClassName = v26, 
        Children = v27 or {}, 
        GetChildren = v24, 
        GetDebugId = v19
    };
end;
local v29 = {
    {
        Id = v10.ELEMENTS, 
        Label = "Elements"
    }, 
    {
        Id = v10.PROFILE, 
        Label = "Profile"
    }
};
return v1.createReducer({
    tabs = v29, 
    selectedTab = v29[1], 
    targets = {}, 
    selectedTargetName = nil, 
    selectedTarget = nil, 
    expandedTargets = {}
}, {
    [v12.name] = function(v30, v31) --[[ Line: 68 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v30, {
            selectedTab = v31.tab
        });
    end, 
    [v14.name] = function(v32, _) --[[ Line: 73 ]]
        -- upvalues: l_join_0 (copy), l_None_0 (copy)
        return l_join_0(v32, {
            targets = {}, 
            expandedTargets = {}, 
            selectedTarget = l_None_0
        });
    end, 
    [v16.name] = function(v34, v35) --[[ Line: 80 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v34, {
            selectedTarget = v35.target
        });
    end, 
    [v15.name] = function(v36) --[[ Line: 85 ]]
        -- upvalues: l_join_0 (copy), l_None_0 (copy)
        return l_join_0(v36, {
            selectedTarget = l_None_0
        });
    end, 
    [v17.name] = function(v37, v38) --[[ Line: 90 ]]
        -- upvalues: l_joinDeep_0 (copy)
        return l_joinDeep_0(v37, {
            expandedTargets = v38.change
        });
    end, 
    [v13.name] = function(v39, v40) --[[ Line: 95 ]]
        -- upvalues: l_collect_0 (copy), v24 (copy), v19 (copy), l_joinDeep_0 (copy)
        local v41 = ({
            Plugin = "Plugin", 
            CoreGui = "CoreGui", 
            Library = "Frame", 
            StandalonePlugin = "Plugin"
        })[v40.sourceKind] or "Frame";
        local v47 = l_collect_0(v40.targets, function(_, v43) --[[ Line: 104 ]]
            -- upvalues: v41 (copy), v24 (ref), v19 (ref), v40 (copy)
            local l_name_0 = v43.name;
            local l_v41_0 = v41;
            local v46 = {
                Name = l_name_0, 
                ClassName = l_v41_0, 
                Children = {}, 
                GetChildren = v24, 
                GetDebugId = v19
            };
            l_name_0 = v43.name == "Roact tree" and "" or " - " .. v43.name;
            v46.Id = v43.id;
            v46.Name = v40.sourceName .. l_name_0;
            v46.BridgeId = v40.fromBridgeId;
            return v43.id, v46;
        end);
        return (l_joinDeep_0(v39, {
            targets = v47
        }));
    end
});