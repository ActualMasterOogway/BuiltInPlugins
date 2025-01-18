local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local v4 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v4.ContextServices.withContext;
local l_Signals_0 = v3.Contexts.Signals;
local l_LuaMeshEditingModuleContext_0 = v3.Contexts.LuaMeshEditingModuleContext;
local v8 = require(l_Parent_0.Src.Components.MeshPartTool);
local v9 = require(l_Parent_0.Src.Components.Draggers.LuaMeshEditingModuleWrapper);
local v10 = require(l_Parent_0.Src.Actions.SetToolMode);
local v11 = require(l_Parent_0.Src.Util.Constants);
local v12 = require(l_Parent_0.Src.Util.DebugFlags);
local v13 = v1.PureComponent:extend("EditorToolsManager");
local v14 = require(l_Parent_0.Src.Components.Editor.WorkspaceEditorControls);
local _ = v4.Util;
v13.init = function(v16) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v11 (copy)
    v16.editorFrameRef = v1.createRef();
    v16.onToolChange = function(v17) --[[ Line: 40 ]]
        -- upvalues: v16 (copy), v11 (ref)
        v16.props.SetToolMode(v17);
        v16.props.Signals:get(v11.SIGNAL_KEYS.SelectionChanged):Fire();
        v16.props.Signals:get(v11.SIGNAL_KEYS.ToolChanged):Fire();
    end;
end;
v13.render = function(v18) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v12 (copy), v1 (copy), v14 (copy), v8 (copy), v9 (copy)
    local l_props_0 = v18.props;
    local _ = l_props_0.ToolMode;
    local _ = l_props_0.Size;
    local l_EditingCage_0 = l_props_0.EditingCage;
    local _ = l_props_0.LayoutOrder;
    local v24 = l_EditingCage_0 == v11.EDIT_MODE.Mesh;
    local v25 = false;
    if l_EditingCage_0 ~= nil then
        v25 = not v24;
    end;
    local v26 = v12.RunRhodiumTests() or v12.RunTests();
    return v1.createFragment({
        WorkspaceEditorControls = v1.createElement(v14), 
        MeshPartTool = v24 and v1.createElement(v8), 
        LuaMeshEditingModuleWrapper = not v26 and v25 and v1.createElement(v9) or nil
    });
end;
v13.willUpdate = function(v27, v28) --[[ Line: 66 ]] --[[ Name: willUpdate ]]
    -- upvalues: v11 (copy)
    local v29 = false;
    local l_LuaMeshEditingModuleContext_1 = v27.props.LuaMeshEditingModuleContext;
    if v28.ToolMode ~= v27.props.ToolMode then
        if v28.ToolMode == v11.TOOL_MODE.Point or v28.ToolMode == v11.TOOL_MODE.Lattice then
            l_LuaMeshEditingModuleContext_1:setCurrentTool(v28.ToolMode);
            v29 = true;
        elseif v28.ToolMode ~= v11.TOOL_MODE.Reset then
            l_LuaMeshEditingModuleContext_1:setCurrentTool(nil);
            v29 = true;
        end;
    end;
    l_LuaMeshEditingModuleContext_1:changeEditingCage(v28.EditingCage);
    if v29 and v28.ToolMode ~= v27.props.ToolMode then
        l_LuaMeshEditingModuleContext_1:getToolChangedSignal():Fire();
    end;
end;
v13.willUnmount = function(v31) --[[ Line: 88 ]] --[[ Name: willUnmount ]]
    local l_LuaMeshEditingModuleContext_2 = v31.props.LuaMeshEditingModuleContext;
    if l_LuaMeshEditingModuleContext_2 then
        l_LuaMeshEditingModuleContext_2:setCurrentTool(nil);
    end;
end;
v13 = l_withContext_0({
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0, 
    Signals = l_Signals_0
})(v13);
return v2.connect(function(v33, _) --[[ Line: 100 ]] --[[ Name: mapStateToProps ]]
    local l_status_0 = v33.status;
    local _ = v33.cageData;
    local l_selectItem_0 = v33.selectItem;
    return {
        ToolMode = l_status_0.toolMode, 
        EditingCage = l_selectItem_0.editingCage
    };
end, function(v38) --[[ Line: 111 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy)
    return {
        SetToolMode = function(v39) --[[ Line: 113 ]] --[[ Name: SetToolMode ]]
            -- upvalues: v38 (copy), v10 (ref)
            v38(v10(v39));
        end
    };
end)(v13);