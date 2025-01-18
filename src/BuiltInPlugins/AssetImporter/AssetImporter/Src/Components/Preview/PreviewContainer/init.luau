local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_withContext_0 = v3.ContextServices.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local v9 = require(l_script_FirstAncestor_0.Src.Components.Preview.WorkspacePreview);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Preview.AxisIndicator);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Preview.PreviewControls);
local v12 = require(l_script_FirstAncestor_0.Src.Components.Preview.RigVisualization);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetSettingsChanged);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v15 = require(l_script_FirstAncestor_0.Src.Utility.getAssetPreviewProps);
local v16 = require(l_script_FirstAncestor_0.Src.Utility.getAssetRenderModel);
local v17 = require(l_script_FirstAncestor_0.Src.Utility.loadAnimation);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUploadWidgetCleanup);
local v19 = v1.PureComponent:extend("PreviewContainer");
v19.init = function(v20) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy)
    local l_props_0 = v20.props;
    v20:setState({
        showContext = false
    });
    v20.recenterCamera = false;
    v20.recenterModel = true;
    v20.lastCamCFrame = CFrame.identity;
    v20.previewProps = v15(l_props_0.PreviewInstance, l_props_0.ImportTree, l_props_0.SelectedImportItem.Id == "0", v20.state.showContext);
    v20.camera = Instance.new("Camera");
    v20.onClickCenterCamera = function() --[[ Line: 52 ]]
        -- upvalues: v16 (ref), v20 (copy)
        local v22 = v16(v20.props.PreviewInstance):GetExtentsSize().Magnitude * 0.8;
        local l_Unit_0 = Vector3.new(-1, 1, -1, 0).Unit;
        v20.camera.Focus = CFrame.identity;
        v20.camera.CFrame = CFrame.new(v22 * l_Unit_0, v20.camera.Focus.Position);
    end;
    v20.onClickToggleContext = function() --[[ Line: 60 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            showContext = not v20.state.showContext
        });
    end;
    v20.onClickRigVisualization = function() --[[ Line: 66 ]]
        -- upvalues: v20 (copy)
        local l_props_1 = v20.props;
        l_props_1.ImportTree.RigVisualization = not l_props_1.ImportTree.RigVisualization;
        if l_props_1.SelectedImportItem then
            local l_Preview_0 = l_props_1.SelectedImportItem:GetPreview();
            l_props_1.UpdatePreviewInstance(l_Preview_0);
        end;
    end;
    v20.isRigVisualized = function() --[[ Line: 76 ]]
        -- upvalues: v20 (copy)
        local l_props_2 = v20.props;
        local v27 = l_props_2.SelectedImportItem:IsA("JointImportData");
        local v28 = l_props_2.SelectedImportItem:IsA("RootImportData");
        return l_props_2.ImportTree.RigVisualization and v28 or v27;
    end;
    v20.loadAnimationIntoViewport = function(v29) --[[ Line: 83 ]]
        -- upvalues: v20 (copy), v17 (ref)
        if v20.props.SelectedImportItem:IsA("AnimationImportData") then
            local v30 = nil;
            do
                local l_v30_0 = v30;
                l_v30_0 = v29.AncestryChanged:connect(function(_, v33) --[[ Line: 86 ]]
                    -- upvalues: l_v30_0 (ref), v29 (copy), v17 (ref)
                    if v33 and v33:IsDescendantOf(game) then
                        l_v30_0:Disconnect();
                        local l_v29_FirstChildWhichIsA_0 = v29:FindFirstChildWhichIsA("KeyframeSequence", true);
                        if l_v29_FirstChildWhichIsA_0 then
                            v17(v29, l_v29_FirstChildWhichIsA_0);
                        end;
                    end;
                end);
            end;
        end;
    end;
end;
v19.handleCameraTransition = function(v35, v36, v37) --[[ Line: 99 ]] --[[ Name: handleCameraTransition ]]
    -- upvalues: v15 (copy)
    local l_SelectedImportItem_0 = v35.props.SelectedImportItem;
    local l_SelectedImportItem_1 = v36.SelectedImportItem;
    if l_SelectedImportItem_0:IsA("RootImportData") or l_SelectedImportItem_0:IsA("MeshImportData") or l_SelectedImportItem_0:IsA("GroupImportData") then
        v35.lastCamCFrame = v35.camera.CFrame;
    end;
    v35.previewProps = v15(v36.PreviewInstance, v36.ImportTree, v36.SelectedImportItem.Id == "0", v37.showContext);
    if l_SelectedImportItem_1:IsA("RootImportData") or l_SelectedImportItem_1:IsA("MeshImportData") or l_SelectedImportItem_1:IsA("GroupImportData") then
        v35.camera.CFrame = v35.lastCamCFrame;
        v35.recenterCamera = false;
        return;
    else
        v35.recenterCamera = true;
        return;
    end;
end;
v19.willUpdate = function(v40, v41, v42) --[[ Line: 135 ]] --[[ Name: willUpdate ]]
    v40:handleCameraTransition(v41, v42);
end;
v19.didUpdate = function(v43, v44) --[[ Line: 139 ]] --[[ Name: didUpdate ]]
    if v44.SelectedImportItem ~= v43.props.SelectedImportItem then
        v43.onClickCenterCamera();
    end;
end;
v19.render = function(v45) --[[ Line: 148 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), v9 (copy), v11 (copy), l_AssetRenderModel_0 (copy), v12 (copy), v10 (copy)
    local l_props_3 = v45.props;
    local l_Stylizer_1 = l_props_3.Stylizer;
    local l_Sizes_0 = l_Stylizer_1.Sizes;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_3.LayoutOrder, 
        Size = UDim2.new(1, 0, l_Sizes_0.PreviewRatio, 0)
    }, {
        WorkspacePreviewContainer = v1.createElement(l_Pane_0, {
            ZIndex = 1
        }, {
            WorkspacePreview = v1.createElement(v9, {
                Model = v45.previewProps.workspacePreview, 
                ReferenceCamera = v45.camera, 
                Offset = v45.previewProps.insertContextOffset
            })
        }), 
        PreviewControls = v1.createElement(v11, {
            InsertContextCallback = v45.onClickToggleContext, 
            ResetCameraCallback = v45.onClickCenterCamera, 
            ShouldShowWorkspaceToggle = l_props_3.SelectedImportItem:IsA("RootImportData") and l_props_3.SelectedImportItem.InsertInWorkspace, 
            ShouldShowRigVisualizationToggle = l_props_3.SelectedImportItem:IsA("RootImportData") and l_props_3.AssetImportSession:isAvatar(), 
            VisualizeRigCallback = v45.onClickRigVisualization
        }), 
        PreviewRenderContainer = v1.createElement(l_Pane_0, {
            ZIndex = 2
        }, {
            PreviewRender = v1.createElement(l_AssetRenderModel_0, {
                Model = v45.previewProps.model, 
                InitialDistance = v45.previewProps.initDist, 
                Camera = v45.camera, 
                FocusDirection = Vector3.new(-1, 1, -1, 0), 
                RecenterCameraOnUpdate = v45.recenterCamera, 
                RecenterModelOnUpdate = v45.recenterModel, 
                OnViewModelLoaded = v45.loadAnimationIntoViewport, 
                Ambient = l_Stylizer_1.PreviewWindow.Lighting.Ambient, 
                LightColor = l_Stylizer_1.PreviewWindow.Lighting.Color, 
                LightDirection = l_Stylizer_1.PreviewWindow.Lighting.Direction
            })
        }), 
        RigVisualization = if v45.isRigVisualized() then v1.createElement(l_Pane_0, {
            ZIndex = 3
        }, {
            v1.createElement(v12, {
                PreviewInstance = l_props_3.PreviewInstance, 
                Camera = v45.camera, 
                AssetImportSession = l_props_3.AssetImportSession, 
                SelectedImportItem = l_props_3.SelectedImportItem
            })
        }) else nil, 
        AxisIndicatorContainer = v1.createElement(l_Pane_0, {
            Size = UDim2.new(0, l_Sizes_0.IndicatorSize, 0, l_Sizes_0.IndicatorSize), 
            Position = UDim2.new(1, l_Sizes_0.IndicatorOffset, 1, l_Sizes_0.IndicatorOffset), 
            AnchorPoint = Vector2.new(1, 1), 
            ZIndex = 4
        }, {
            AxisIndicator = v1.createElement(v10, {
                ReferenceCamera = v45.camera
            })
        })
    });
end;
v19 = l_withContext_0({
    Stylizer = l_Stylizer_0
})(v19);
return v2.connect(function(v49) --[[ Line: 234 ]] --[[ Name: mapStateToProps ]]
    return {
        AssetImportSession = v49.Preview.assetImportSession, 
        ImportTree = v49.Preview.importTree, 
        PreviewInstance = v49.Preview.previewInstance, 
        SelectedImportItem = v49.Preview.selectedImportItem
    };
end, function(v50) --[[ Line: 221 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v13 (copy), v14 (copy)
    return {
        SetSettingsChanged = not v18() and function(v51) --[[ Line: 224 ]]
            -- upvalues: v50 (copy), v13 (ref)
            v50(v13(v51));
        end or nil, 
        UpdatePreviewInstance = function(v52) --[[ Line: 228 ]] --[[ Name: UpdatePreviewInstance ]]
            -- upvalues: v50 (copy), v14 (ref)
            v50(v14(v52));
        end
    };
end)(v19);