local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = v1.PureComponent:extend("WorkspacePreview");
v2.updateViewportModel = function(v3, v4) --[[ Line: 8 ]] --[[ Name: updateViewportModel ]]
    local v5 = v3.viewportFrameRef:getValue();
    if v5 then
        v3.viewportFrameModel = v4.Model:Clone();
        v3.viewportFrameModel:PivotTo(v4.Offset);
        v5:ClearAllChildren();
        v3.viewportFrameModel.Parent = v5;
    end;
end;
v2.init = function(v6) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v6.props;
    v6.viewportFrameRef = v1.createRef();
    v6.camera = l_props_0.ReferenceCamera;
    v6.viewportFrameModel = nil;
    if l_props_0.Model then
        v6:updateViewportModel(l_props_0);
    end;
end;
v2.willUnmount = function(v8) --[[ Line: 28 ]] --[[ Name: willUnmount ]]
    if v8.viewportFrameModel then
        v8.viewportFrameModel:Destroy();
        v8.viewportFrameModel = nil;
    end;
end;
v2.willUpdate = function(v9, v10) --[[ Line: 37 ]] --[[ Name: willUpdate ]]
    local v11 = v9.viewportFrameRef:getValue();
    if v10.Model then
        v9:updateViewportModel(v10);
        return;
    else
        v9.viewportFrameModel:Destroy();
        v9.viewportFrameModel = nil;
        v11:ClearAllChildren();
        return;
    end;
end;
v2.render = function(v12) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_1 = v12.props;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Position_0 = l_props_1.Position;
    local v16 = l_props_1.Size or UDim2.new(1, 0, 1, 0);
    local l_camera_0 = v12.camera;
    return v1.createElement("ViewportFrame", {
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = v16, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ImageTransparency = 0.7, 
        CurrentCamera = l_camera_0, 
        [v1.Ref] = v12.viewportFrameRef
    });
end;
return v2;