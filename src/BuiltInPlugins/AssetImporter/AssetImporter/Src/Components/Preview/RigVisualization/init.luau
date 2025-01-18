local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = v1.PureComponent:extend("RigVisualization");
v2.init = function(v3) --[[ Line: 8 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v3.viewportFrameRef = v1.createRef();
    v3.camera = v3.props.Camera;
    v3.viewportFrameModel = nil;
    v3.centerModel = function(v4) --[[ Line: 14 ]]
        -- upvalues: v3 (copy)
        local l_viewportFrameModel_0 = v3.viewportFrameModel;
        local _ = nil;
        l_viewportFrameModel_0:TranslateBy(if v4:IsA("Model") then -v4:GetBoundingBox().Position else -v4.CFrame.Position);
    end;
end;
v2.addViewportModel = function(v7) --[[ Line: 27 ]] --[[ Name: addViewportModel ]]
    v7.viewportFrameModel = v7.props.AssetImportSession:GetRigVisualization(v7.props.SelectedImportItem):Clone();
    local l_PreviewInstance_0 = v7.props.PreviewInstance;
    v7.centerModel(l_PreviewInstance_0);
    local v9 = v7.viewportFrameRef:getValue();
    if v9 then
        v7.viewportFrameModel.Parent = v9;
    end;
end;
v2.didUpdate = function(v10) --[[ Line: 40 ]] --[[ Name: didUpdate ]]
    if v10.viewportFrameModel then
        v10.viewportFrameModel:Destroy();
        v10.viewportFrameModel = nil;
    end;
    v10:addViewportModel();
end;
v2.didMount = function(v11) --[[ Line: 48 ]] --[[ Name: didMount ]]
    v11:addViewportModel();
end;
v2.willUnmount = function(v12) --[[ Line: 52 ]] --[[ Name: willUnmount ]]
    if v12.viewportFrameModel then
        v12.viewportFrameModel:Destroy();
        v12.viewportFrameModel = nil;
    end;
end;
v2.render = function(v13) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v13.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v16 = l_props_0.Position or UDim2.new(0, 0, 0, 0);
    local v17 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local l_camera_0 = v13.camera;
    return v1.createElement("ViewportFrame", {
        LayoutOrder = l_LayoutOrder_0, 
        Position = v16, 
        Size = v17, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        CurrentCamera = l_camera_0, 
        [v1.Ref] = v13.viewportFrameRef
    });
end;
return v2;