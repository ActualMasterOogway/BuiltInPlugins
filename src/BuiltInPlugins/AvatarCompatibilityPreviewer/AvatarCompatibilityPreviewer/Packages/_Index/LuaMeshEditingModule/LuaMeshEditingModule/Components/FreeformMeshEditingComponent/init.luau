local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DraggerFramework);
local v3 = require(l_Parent_0.Roact);
local l_DraggerContext_PluginImpl_0 = v2.Implementation.DraggerContext_PluginImpl;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v6 = require(l_Components_0.MeshEditingDragger);
local l_DraggerSchema_0 = l_script_FirstAncestor_0.DraggerSchema;
local v8 = require(l_DraggerSchema_0.Selection);
local v9 = v3.PureComponent:extend("FreeformMeshEditingComponent");
v9.init = function(v10, v11) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_DraggerContext_PluginImpl_0 (copy)
    local _ = v10.props.Mouse;
    v10.selection = v8.new(v11.VertexToolBase);
    v11.VertexToolBase:setMouse(v11.Mouse);
    v11.VertexToolBase:setRadius(v11.Radius);
    v11.VertexToolBase:setFalloff(v11.Falloff);
    v11.VertexToolBase:setMannequin(v11.Mannequin);
    v11.VertexToolBase:setOnChangeSelectedPositions(v11.OnChangeSelectedPositions);
    v10.draggerContext = l_DraggerContext_PluginImpl_0.new(v11.Plugin, game, settings(), v10.selection);
    v10.draggerContext.vertexEditingTool = v11.VertexToolBase;
end;
v9.didMount = function(v13) --[[ Line: 28 ]] --[[ Name: didMount ]]
    v13.props.Plugin:Activate(true);
end;
v9.render = function(v14) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v6 (copy)
    local l_props_0 = v14.props;
    local _ = v14.state;
    local l_Mouse_1 = l_props_0.Mouse;
    return v3.createElement(v6, {
        Mouse = l_Mouse_1, 
        DraggerType = nil, 
        Context = v14.draggerContext
    });
end;
v9.didUpdate = function(v18, v19) --[[ Line: 45 ]] --[[ Name: didUpdate ]]
    if v19.VertexToolBase ~= v18.props.VertexToolBase and v18.draggerContext then
        if v18.draggerHandleChanged then
            v18.draggerHandleChanged:Disconnect();
        end;
        if v18.selection then
            v18.selection:setVertexToolBase(v19.VertexToolBase);
            v18.draggerContext.vertexToolBase = v19.VertexToolBase;
            v18.selection.SelectionChanged:Fire();
        end;
        v19.VertexToolBase:setMouse(v19.Mouse);
    end;
    if v19.Falloff ~= v18.props.Falloff then
        v19.VertexToolBase:setFalloff(v19.Falloff);
    end;
    if v19.Radius ~= v18.props.Radius then
        v19.VertexToolBase:setRadius(v19.Radius);
    end;
    if v19.Mannequin ~= v18.props.Mannequin then
        v19.VertexToolBase:setMannequin(v19.Mannequin);
    end;
end;
return v9;