local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_Parent_1 = script.Parent.Parent;
local l_AccessoryAndBodyToolShared_0 = l_Parent_1.Util.AccessoryAndBodyToolShared;
local v4 = require(l_AccessoryAndBodyToolShared_0.Constants);
local v5 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v5.UI.Pane;
local l_IconButton_0 = v5.UI.IconButton;
local l_AssetRenderModel_0 = v5.UI.AssetRenderModel;
local v11 = require(l_Parent_1.Contexts.PreviewContext);
local v12 = require(l_Parent_1.Components.PreviewAvatarWheel);
local _ = require(l_Parent_1.Components.PreviewRenderModel);
local v14 = require(l_Parent_1.Components.LayerOrderManager);
local v15 = require(l_Parent_1.Components.LayerTile);
local v16 = v1.PureComponent:extend("PreviewViewportFrame");
v16.defaultProps = {
    LayerOrderManagerCapacity = v4.LAYER_LIMIT, 
    PreviewAvatarWheelCapacity = v4.AVATAR_LIMIT, 
    ShowEmptyBoxes = true, 
    FocusDirection = Vector3.new(0, 0, -1, 0)
};
v16.init = function(v17) --[[ Line: 46 ]] --[[ Name: init ]]
    v17.currentAvatar = nil;
    v17.thumbnailModels = {};
    v17.thumbnailModelClones = {};
    v17.camera = Instance.new("Camera");
    v17.onViewModelLoaded = function(v18) --[[ Line: 53 ]]
        -- upvalues: v17 (copy)
        if v18.Parent then
            v17.props.PreviewContext:getAnimationTargetChangedSignal():Fire();
            return;
        else
            local v19 = nil;
            v19 = v18.AncestryChanged:Connect(function(_, v21) --[[ Line: 58 ]]
                -- upvalues: v19 (ref), v17 (ref)
                v19:Disconnect();
                if v21 then
                    v17.props.PreviewContext:getAnimationTargetChangedSignal():Fire();
                end;
            end);
            return;
        end;
    end;
    v17.recenterCamera = function() --[[ Line: 67 ]]
        -- upvalues: v17 (copy)
        if not v17.worldModel or not v17.camera then
            return;
        else
            local v22 = v17.worldModel:GetExtentsSize().magnitude * 0.8;
            local l_Unit_0 = v17.props.FocusDirection.Unit;
            v17.camera.Focus = CFrame.new();
            v17.camera.CFrame = CFrame.new(v22 * l_Unit_0, (Vector3.new()));
            return;
        end;
    end;
    v17.updateModelClones = function() --[[ Line: 81 ]]
        -- upvalues: v17 (copy)
        local v24 = v17.props.PreviewContext:getAvatars();
        for _, v26 in ipairs(v24) do
            if v26.model then
                local l_model_0 = v26.model;
                local l_id_0 = v26.id;
                if not v17.thumbnailModelClones[l_id_0] then
                    l_model_0.Archivable = true;
                    for _, v30 in ipairs(l_model_0:GetDescendants()) do
                        v30.Archivable = true;
                    end;
                    local v31 = l_model_0:Clone();
                    v31.Archivable = true;
                    for _, v33 in ipairs(v31:GetDescendants()) do
                        v33.Archivable = true;
                    end;
                    v17.thumbnailModelClones[l_id_0] = v31;
                end;
            end;
        end;
    end;
    v17.onPreviewModelChanged = function() --[[ Line: 103 ]]
        -- upvalues: v17 (copy)
        local l_PreviewContext_0 = v17.props.PreviewContext;
        local v35 = l_PreviewContext_0:getAvatars();
        local v36 = l_PreviewContext_0:getCurrentPreviewAvatarIndex();
        if v35[v36] and v35[v36] ~= v17.currentAvatar then
            if v17.currentAvatar and v17.currentAvatar.model then
                v17.currentAvatar.model.Parent = nil;
            end;
            v17.currentAvatar = v35[v36];
            if v17.worldModel then
                v17.worldModel:Destroy();
            end;
            v17.worldModel = Instance.new("WorldModel");
            v17.updateModelClones();
            v17.thumbnailModels = v17.getAvatarThumbnailModels();
            v17.currentAvatar.model.Parent = v17.worldModel;
            v17:setState({
                temp = {}
            });
            return;
        else
            if #v35 == 0 then
                if v17.worldModel then
                    v17.worldModel:Destroy();
                end;
                v17.currentAvatar = nil;
                v17:setState({
                    temp = {}
                });
            end;
            return;
        end;
    end;
    v17.getAvatarThumbnailModels = function() --[[ Line: 136 ]]
        -- upvalues: v17 (copy)
        local l_PreviewContext_1 = v17.props.PreviewContext;
        local v38 = {};
        if l_PreviewContext_1 then
            local v39 = l_PreviewContext_1:getAvatars();
            for _, v41 in ipairs(v39) do
                local l_model_1 = v41.model;
                local l_id_1 = v41.id;
                if l_model_1 and l_model_1:IsA("Model") and v17.thumbnailModelClones[l_id_1] then
                    table.insert(v38, v17.thumbnailModelClones[l_id_1]);
                end;
            end;
        end;
        return v38;
    end;
end;
v16.render = function(v44) --[[ Line: 153 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_AssetRenderModel_0 (copy), v14 (copy), v15 (copy), v12 (copy), l_IconButton_0 (copy)
    local l_props_0 = v44.props;
    local l_PreviewContext_2 = l_props_0.PreviewContext;
    local l_OnPopoutClicked_0 = l_props_0.OnPopoutClicked;
    local l_ShowPopoutButton_0 = l_props_0.ShowPopoutButton;
    local l_Stylizer_0 = l_props_0.Stylizer;
    if not v44.currentAvatar or not v44.currentAvatar.model then
        return nil;
    else
        local l_thumbnailModels_0 = v44.thumbnailModels;
        local l_clothing_0 = v44.currentAvatar.clothing;
        return v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_Stylizer_0.BackgroundColor
        }, {
            PreviewRenderModel = v1.createElement(l_AssetRenderModel_0, {
                Camera = v44.camera, 
                Model = v44.worldModel, 
                ShouldClone = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                RecenterCameraOnUpdate = false, 
                RecenterModelOnUpdate = false, 
                FocusDirection = l_props_0.FocusDirection, 
                OnViewModelLoaded = v44.onViewModelLoaded
            }), 
            Overlay = v1.createElement(l_Pane_0, {
                ZIndex = 99, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                LayerOrderManager = v1.createElement(v14, {
                    PreviewClothing = l_clothing_0, 
                    Size = l_Stylizer_0.LayerOrderManagerSize, 
                    AnchorPoint = l_Stylizer_0.LayerOrderManagerAnchorPoint, 
                    Position = l_Stylizer_0.LayerOrderManagerPosition, 
                    Capacity = l_props_0.LayerOrderManagerCapacity, 
                    ShowEmptyBoxes = l_props_0.ShowEmptyBoxes, 
                    TileComponent = v15, 
                    OnCapacityReached = v44.props.OnCapacityReached
                }), 
                PreviewAvatarWheel = v1.createElement(v12, {
                    PreviewAvatars = l_thumbnailModels_0, 
                    SelectedIndex = l_PreviewContext_2:getCurrentPreviewAvatarIndex(), 
                    Size = l_Stylizer_0.PreviewAvatarWheelSize, 
                    Position = l_Stylizer_0.PreviewAvatarWheelPosition, 
                    AnchorPoint = l_Stylizer_0.PreviewAvatarWheelAnchorPoint, 
                    Capacity = l_props_0.PreviewAvatarWheelCapacity
                }), 
                PopoutButton = l_ShowPopoutButton_0 and v1.createElement(l_IconButton_0, {
                    LeftIcon = l_Stylizer_0.Icon, 
                    IconSize = l_Stylizer_0.IconSize, 
                    Size = UDim2.fromOffset(l_Stylizer_0.PopoutButtonSize, l_Stylizer_0.PopoutButtonSize), 
                    Position = UDim2.new(0, l_Stylizer_0.PopoutButtonOffset, 1, -l_Stylizer_0.PopoutButtonOffset), 
                    AnchorPoint = Vector2.new(0, 1), 
                    OnClick = l_OnPopoutClicked_0
                }), 
                RecenterButton = v1.createElement(l_IconButton_0, {
                    LeftIcon = l_Stylizer_0.RecenterIcon, 
                    IconSize = l_Stylizer_0.IconSize, 
                    Size = UDim2.fromOffset(l_Stylizer_0.PopoutButtonSize, l_Stylizer_0.PopoutButtonSize), 
                    Position = UDim2.new(0, l_Stylizer_0.PopoutButtonOffset, 0, l_Stylizer_0.PopoutButtonOffset), 
                    OnClick = v44.recenterCamera
                })
            })
        });
    end;
end;
v16.didMount = function(v52) --[[ Line: 225 ]] --[[ Name: didMount ]]
    v52.PreviewModelChangedHandle = v52.props.PreviewContext:getPreviewModelChangedSignal():Connect(v52.onPreviewModelChanged);
    v52.onPreviewModelChanged();
end;
v16.didUpdate = function(v53) --[[ Line: 232 ]] --[[ Name: didUpdate ]]
    if v53.worldModel and v53.currentAvatar and v53.currentAvatar.model then
        v53.worldModel:PivotTo(CFrame.new());
        v53.currentAvatar.model:PivotTo(CFrame.new());
    end;
end;
v16.willUnmount = function(v54) --[[ Line: 243 ]] --[[ Name: willUnmount ]]
    if v54.currentAvatar then
        if v54.currentAvatar.model then
            v54.currentAvatar.model.Parent = nil;
        end;
        v54.currentAvatar = nil;
    end;
    if v54.worldModel then
        v54.worldModel:Destroy();
        v54.worldModel = nil;
    end;
    if v54.PreviewModelChangedHandle then
        v54.PreviewModelChangedHandle:Disconnect();
        v54.PreviewModelChangedHandle = nil;
    end;
    if v54.thumbnailModelClones then
        for _, v56 in ipairs(v54.thumbnailModelClones) do
            v56:Destroy();
        end;
        v54.thumbnailModelClones = {};
    end;
    if v54.camera then
        v54.camera:Destroy();
        v54.camera = nil;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    PreviewContext = v11
})(v16));