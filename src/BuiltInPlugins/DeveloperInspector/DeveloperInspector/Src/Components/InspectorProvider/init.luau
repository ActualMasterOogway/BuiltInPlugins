local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local v5 = require(l_Parent_0.Src.Util.InspectorContext);
local l_DeveloperTools_0 = v3.DeveloperTools;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v8 = require(l_Actions_0.AddTargets);
local v9 = require(l_Actions_0.ClearTargets);
local v10 = require(l_Actions_0.RoactInspector.PickInstance);
local v11 = require(l_Actions_0.RoactInspector.UpdateInstances);
local v12 = require(l_Actions_0.RoactInspector.UpdateBranch);
local v13 = require(l_Actions_0.RoactInspector.UpdateFields);
local v14 = require(l_Actions_0.SetTab);
local v15 = require(l_Actions_0.RoactInspector.UpdateProfileData);
local v16 = v1.PureComponent:extend("InspectorProvider");
v16.init = function(v17) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: l_DeveloperTools_0 (copy), v5 (copy)
    v17.inspector = l_DeveloperTools_0.forInspector({
        onAddTargets = v17.props.addTargets, 
        RoactInspector = {
            onUpdateInstances = v17.props.updateInstances, 
            onUpdateBranch = v17.props.updateBranch, 
            onUpdateFields = v17.props.updateFields, 
            onPickInstance = function(v18) --[[ Line: 30 ]] --[[ Name: onPickInstance ]]
                -- upvalues: v17 (copy)
                v17.props.pickInstance(v17.props.Tabs[1], v18);
            end, 
            onUpdateProfileData = v17.props.updateProfileData
        }
    });
    v17.inspectorContext = v5.new(v17.inspector);
end;
v16.didMount = function(v19) --[[ Line: 39 ]] --[[ Name: didMount ]]
    v19.inspector:getTargets();
end;
v16.willUnmount = function(v20) --[[ Line: 45 ]] --[[ Name: willUnmount ]]
    if v20.inspector then
        v20.inspector:destroy();
    end;
end;
v16.didUpdate = function(v21, v22) --[[ Line: 51 ]] --[[ Name: didUpdate ]]
    if v22.Active == false and v21.props.Active == true then
        v21.props.clearTargets();
        v21.inspector:getTargets();
    end;
end;
v16.render = function(v23) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), v1 (copy)
    return l_ContextServices_0.provide({
        v23.inspectorContext
    }, v23.props[v1.Children]);
end;
return v2.connect(function(v24) --[[ Line: 65 ]]
    return {
        Tabs = v24.Targets.tabs
    };
end, function(v25) --[[ Line: 69 ]]
    -- upvalues: v9 (copy), v8 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v10 (copy), v15 (copy)
    return {
        clearTargets = function() --[[ Line: 71 ]] --[[ Name: clearTargets ]]
            -- upvalues: v25 (copy), v9 (ref)
            v25(v9());
        end, 
        addTargets = function(v26) --[[ Line: 74 ]] --[[ Name: addTargets ]]
            -- upvalues: v25 (copy), v8 (ref)
            v25(v8(v26));
        end, 
        updateInstances = function(v27, v28, v29) --[[ Line: 77 ]] --[[ Name: updateInstances ]]
            -- upvalues: v25 (copy), v11 (ref)
            v25(v11(v27, v28, v29));
        end, 
        updateBranch = function(v30, v31) --[[ Line: 80 ]] --[[ Name: updateBranch ]]
            -- upvalues: v25 (copy), v12 (ref)
            v25(v12(v30, v31));
        end, 
        updateFields = function(v32, v33, v34, v35) --[[ Line: 83 ]] --[[ Name: updateFields ]]
            -- upvalues: v25 (copy), v13 (ref)
            v25(v13(v32, v33, v34, v35));
        end, 
        pickInstance = function(v36, v37) --[[ Line: 86 ]] --[[ Name: pickInstance ]]
            -- upvalues: v25 (copy), v14 (ref), v10 (ref)
            v25(v14(v36));
            v25(v10(v37));
        end, 
        updateProfileData = function(v38) --[[ Line: 90 ]] --[[ Name: updateProfileData ]]
            -- upvalues: v25 (copy), v15 (ref)
            v25(v15(v38));
        end
    };
end)(v16);