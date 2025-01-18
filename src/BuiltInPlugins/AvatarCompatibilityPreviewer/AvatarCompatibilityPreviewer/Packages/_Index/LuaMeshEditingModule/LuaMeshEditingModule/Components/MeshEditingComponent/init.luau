local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.DraggerFramework);
local v3 = require(l_Parent_1.Roact);
local l_DraggerContext_PluginImpl_0 = v2.Implementation.DraggerContext_PluginImpl;
local l_Components_0 = l_Parent_0.Components;
local v6 = require(l_Components_0.MeshEditingDragger);
local l_DraggerSchema_0 = l_Parent_0.DraggerSchema;
local v8 = require(l_DraggerSchema_0.Selection);
local v9 = v3.PureComponent:extend("MeshEditingComponent");
local function _(v10, v11) --[[ Line: 16 ]] --[[ Name: setupDraggerHandleChanged ]]
    v10.draggerHandleChanged = v11:getDraggerHandleChangedSignal():Connect(function() --[[ Line: 17 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            draggerType = v10.props.VertexToolBase:getCurrentHandle()
        });
    end);
end;
v9.init = function(v13, v14) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_DraggerContext_PluginImpl_0 (copy)
    v13.selection = v8.new(v14.VertexToolBase);
    v14.VertexToolBase:setMouse(v14.Mouse);
    v13.draggerContext = l_DraggerContext_PluginImpl_0.new(v14.Plugin, game, settings(), v13.selection);
    v13.draggerContext.vertexEditingTool = v14.VertexToolBase;
    v13.state = {
        draggerType = v14.VertexToolBase:getCurrentHandle()
    };
    v13.draggerHandleChanged = v14.VertexToolBase:getDraggerHandleChangedSignal():Connect(function() --[[ Line: 17 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            draggerType = v13.props.VertexToolBase:getCurrentHandle()
        });
    end);
end;
v9.render = function(v15) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v6 (copy)
    local l_props_0 = v15.props;
    local l_state_0 = v15.state;
    local l_Mouse_0 = l_props_0.Mouse;
    local l_draggerType_0 = l_state_0.draggerType;
    return v3.createElement(v6, {
        Mouse = l_Mouse_0, 
        DraggerType = l_draggerType_0, 
        Context = v15.draggerContext
    });
end;
v9.willUpdate = function(v20, v21) --[[ Line: 51 ]] --[[ Name: willUpdate ]]
    if v21.VertexToolBase ~= v20.props.VertexToolBase and v20.selection and v20.draggerContext then
        if v20.draggerHandleChanged then
            v20.draggerHandleChanged:Disconnect();
        end;
        v20.selection:setVertexToolBase(v21.VertexToolBase);
        v20.draggerContext.vertexToolBase = v21.VertexToolBase;
        v21.VertexToolBase:setCurrentHandle(v20.props.VertexToolBase:getCurrentHandle());
        v21.VertexToolBase:setMouse(v21.Mouse);
        v20.selection.SelectionChanged:Fire();
        v20.draggerHandleChanged = v21.VertexToolBase:getDraggerHandleChangedSignal():Connect(function() --[[ Line: 17 ]]
            -- upvalues: v20 (copy)
            v20:setState({
                draggerType = v20.props.VertexToolBase:getCurrentHandle()
            });
        end);
    end;
end;
v9.willUnmount = function(v22) --[[ Line: 65 ]] --[[ Name: willUnmount ]]
    if v22.draggerHandleChanged then
        v22.draggerHandleChanged:Disconnect();
    end;
end;
return v9;