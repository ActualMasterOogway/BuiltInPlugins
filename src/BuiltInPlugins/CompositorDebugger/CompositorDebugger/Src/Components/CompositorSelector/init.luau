local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v8 = require(l_Components_0.AvatarToolsShared.InstanceSelector);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v10 = require(l_Thunks_0.AttachCompositor);
local v11 = require(l_Thunks_0.DetachCompositor);
local v12 = require(script.PlayerListener);
local v13 = v2.PureComponent:extend("CompositorSelector");
local function v16(v14) --[[ Line: 41 ]] --[[ Name: findActor ]]
    if not v14 then
        return nil;
    else
        assert(v14);
        local v15 = if not not v14:IsA("Actor") or v14:IsA("Model") then v14 else if v14:IsA("Player") then v14.Character else nil;
        if v15 and v15:GetAttribute("HasCompositor") then
            return v15;
        else
            return nil;
        end;
    end;
end;
v13.init = function(v17) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy)
    v17.isSelectedInstanceValid = function(v18) --[[ Line: 56 ]]
        -- upvalues: v16 (ref)
        return v16(v18) ~= nil;
    end;
    v17.onValidSelection = function(v19) --[[ Line: 61 ]]
        -- upvalues: v17 (copy), v16 (ref)
        local l_props_0 = v17.props;
        local v21 = v16(v19);
        if v21 then
            l_props_0.AttachCompositor(v21, l_props_0.Analytics);
        end;
    end;
end;
v13.willUnmount = function(v22) --[[ Line: 70 ]] --[[ Name: willUnmount ]]
    v22.props.DetachCompositor();
end;
v13.render = function(v23) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), v12 (copy)
    return v2.createElement("Folder", {}, {
        InstanceSelector = v2.createElement(v8, {
            IsSelectedInstanceValid = v23.isSelectedInstanceValid, 
            OnValidSelection = v23.onValidSelection, 
            OnInvalidSelection = function() --[[ Line: 79 ]] --[[ Name: OnInvalidSelection ]]

            end
        }), 
        PlayerListener = v2.createElement(v12, {
            IsSelectedInstanceValid = v23.isSelectedInstanceValid, 
            OnValidSelection = v23.onValidSelection, 
            OnInvalidSelection = function() --[[ Line: 84 ]] --[[ Name: OnInvalidSelection ]]

            end
        })
    });
end;
local function v25(v24) --[[ Line: 89 ]] --[[ Name: mapStateToProps ]]
    return {
        DebugDataConnection = v24.Status.DebugDataConnection
    };
end;
local function v29(v26) --[[ Line: 95 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy), v11 (copy)
    return {
        AttachCompositor = function(v27, v28) --[[ Line: 97 ]] --[[ Name: AttachCompositor ]]
            -- upvalues: v26 (copy), v10 (ref)
            v26(v10(v27, v28));
        end, 
        DetachCompositor = function() --[[ Line: 101 ]] --[[ Name: DetachCompositor ]]
            -- upvalues: v26 (copy), v11 (ref)
            v26(v11());
        end
    };
end;
v13 = l_withContext_0({
    Analytics = l_Analytics_0
})(v13);
return (v3.connect(v25, v29)(v13));