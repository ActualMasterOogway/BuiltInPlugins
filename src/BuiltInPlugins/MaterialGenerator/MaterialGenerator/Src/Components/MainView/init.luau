local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.MaterialFramework);
local v4 = require(l_Parent_0.Packages.React);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local _ = require(l_Parent_0.Src.Types);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_Pane_0 = v2.UI.Pane;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_withAbsoluteSize_0 = v2.Wrappers.withAbsoluteSize;
local l_StudioServices_0 = v3.Context.StudioServices;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v18 = require(l_Actions_0.ClearSelectedMaterial);
local v19 = require(l_Actions_0.RemoveAllMaterials);
local v20 = require(l_Actions_0.DEPRECATED_RemoveMaterial);
local v21 = require(l_Actions_0.SetBaseMaterial);
local v22 = require(l_Actions_0.SetGenerationError);
local v23 = require(l_Actions_0.SetSelectedMaterial);
local v24 = require(l_Actions_0.SetInitialImageId);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v26 = require(l_Thunks_0.ApplyMaterial);
local v27 = require(l_Thunks_0.RemoveMaterial);
local v28 = require(l_Thunks_0.UpdateMaterial);
local v29 = require(l_Thunks_0.UploadMaterial);
local l_Components_0 = l_Parent_0.Src.Components;
local v31 = require(l_Components_0.Browser);
local v32 = require(l_Components_0.Header);
local v33 = require(l_Components_0.MaterialView);
local v34 = require(l_Components_0.TextureBrowser);
local v35 = require(l_Components_0.ErrorBox);
local v36 = require(l_Components_0.MaterialVariantProvider);
local v37 = require(l_Parent_0.Src.Controllers.MaterialPreviewController);
local l_Enum_0 = l_Parent_0.Src.Enum;
local v39 = require(l_Enum_0.GenerationErrorType);
local v40 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v41 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local l_join_0 = v1.join;
local v43 = v4.PureComponent:extend("MainView");
v43.init = function(v44) --[[ Line: 103 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    local v45, v46 = v4.createBinding(0);
    v44.generationErrorHeightBinding = v45;
    v44.updateGenerationErrorHeightBinding = v46;
    v44.generationErrorRef = v4.createRef();
    v44.changeGenerationErrorHeight = function() --[[ Line: 108 ]]
        -- upvalues: v44 (copy)
        local l_current_0 = v44.generationErrorRef.current;
        v44.updateGenerationErrorHeightBinding(l_current_0 == nil and 0 or l_current_0.AbsoluteSize.Y);
    end;
end;
v43.didMount = function(v48) --[[ Line: 114 ]] --[[ Name: didMount ]]
    v48:changeGenerationErrorHeight();
end;
v43.didUpdate = function(v49, v50) --[[ Line: 118 ]] --[[ Name: didUpdate ]]
    -- upvalues: v39 (copy)
    if v49.props.GenerationErrorType == v39.None and v50.GenerationErrorType ~= v39.None then
        v49.updateGenerationErrorHeightBinding(0);
    end;
end;
v43.render = function(v51) --[[ Line: 127 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v40 (copy), l_join_0 (copy), v39 (copy), v4 (copy), l_Pane_0 (copy), v35 (copy), v32 (copy), v31 (copy), v34 (copy), v33 (copy), v36 (copy)
    local l_props_0 = v51.props;
    local l_MainView_0 = l_props_0.Stylizer.MainView;
    local l_Header_0 = l_props_0.Stylizer.Header;
    local v55 = l_Header_0.Size.Y.Offset + l_Header_0.Padding * 2;
    local l_SelectedMaterial_0 = l_props_0.SelectedMaterial;
    local v57 = l_LayoutOrderIterator_0.new();
    local v58 = v57:getNextOrder();
    local v59 = nil;
    if v40() then
        v59 = function(v60) --[[ Line: 142 ]] --[[ Name: baseMaterialChanged ]]
            -- upvalues: v51 (copy), l_join_0 (ref), l_SelectedMaterial_0 (copy)
            v51.props.dispatchUpdateMaterial(l_join_0(l_SelectedMaterial_0, {
                BaseMaterial = v60
            }));
        end;
    end;
    local v61 = nil;
    if l_props_0.GenerationErrorType ~= v39.None then
        v61 = v4.createElement(l_Pane_0, {
            LayoutOrder = v57:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Padding = {
                Top = l_Header_0.VerticalSpacing - l_MainView_0.ErrorPadding, 
                Bottom = l_Header_0.VerticalSpacing, 
                Left = l_MainView_0.ErrorPadding, 
                Right = l_MainView_0.ErrorPadding
            }, 
            Size = UDim2.new(1, 0, 0, 0), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            ForwardRef = v51.generationErrorRef, 
            [v4.Change.AbsoluteSize] = v51.changeGenerationErrorHeight
        }, {
            v4.createElement(v35, {
                Text = v51:_getErrorMesssage(l_props_0), 
                Padding = l_MainView_0.ErrorInnerPadding, 
                MaxWidth = l_MainView_0.ErrorMaxWidth, 
                Close = v51.props.dispatchCloseError
            })
        });
    end;
    local l_Analytics_1 = l_props_0.Analytics;
    local v66 = {
        Header = v4.createElement(v32, {
            LayoutOrder = v58
        }), 
        GenerationError = v61, 
        TextureBrowserContainer = v4.createElement(l_Pane_0, {
            LayoutOrder = v57:getNextOrder(), 
            Size = v51.generationErrorHeightBinding:map(function(v63) --[[ Line: 190 ]]
                -- upvalues: v55 (copy)
                return UDim2.new(1, 0, 1, -v55 - v63);
            end)
        }, {
            TextureBrowser = v4.createElement(if v40() then v31 else v34, {
                DisableHover = if v40() then l_SelectedMaterial_0 ~= nil else nil, 
                GeneratingImages = l_props_0.GeneratingImages, 
                Materials = l_props_0.Materials, 
                OnMaterialSelected = l_props_0.dispatchSetSelectedMaterial, 
                OnGenerateVariations = v51.props.dispatchGenerateVariations, 
                OnRemove = l_props_0.dispatchRemoveMaterial, 
                OnRemoveAll = l_props_0.dispatchRemoveAllMaterials, 
                SelectedMaterial = l_SelectedMaterial_0, 
                Size = UDim2.new(1, 0, 1, 0)
            }), 
            MaterialView = if not l_SelectedMaterial_0 or v40() then nil else v4.createElement(v33, {
                IsSavingMaterial = l_props_0.IsSavingMaterial, 
                Material = l_SelectedMaterial_0, 
                OnBaseMaterialChanged = if v40() then v59 else function(v64) --[[ Line: 215 ]]
                    -- upvalues: v51 (copy)
                    v51.props.dispatchSetBaseMaterial(v64);
                end, 
                OnClose = v40() and function() --[[ Line: 219 ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.dispatchSetSelectedMaterial(nil);
                end or l_props_0.dispatchClearSelectedMaterial, 
                OnSaveAndApply = function() --[[ Line: 223 ]] --[[ Name: OnSaveAndApply ]]
                    -- upvalues: v51 (copy), l_SelectedMaterial_0 (copy), l_Analytics_1 (copy)
                    local l_props_1 = v51.props;
                    l_props_1.MaterialPreviewController:plotWaypoint();
                    if l_SelectedMaterial_0.IsTemporary then
                        l_props_1.dispatchUploadMaterial(l_SelectedMaterial_0, l_Analytics_1);
                    end;
                    l_props_1.MaterialPreviewController:preserveCurrentSelection();
                    l_props_1.dispatchApplyMaterial(l_SelectedMaterial_0, l_props_1.StudioServices);
                end
            }), 
            MaterialVariantProvider = if v40() then v4.createElement(v36, {
                FolderName = "MaterialGenerator", 
                Materials = l_props_0.Materials
            }) else nil
        })
    };
    return v4.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Style = "Box", 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, v66);
end;
v43._getErrorMesssage = function(_, v68) --[[ Line: 254 ]] --[[ Name: _getErrorMesssage ]]
    -- upvalues: v39 (copy)
    local l_GenerationErrorType_0 = v68.GenerationErrorType;
    local l_Localization_1 = v68.Localization;
    if l_GenerationErrorType_0 == v39.CustomMessage then
        return v68.GenerationErrorMessage or l_Localization_1:getText("Errors", "UnknownGenerationError");
    elseif l_GenerationErrorType_0 == v39.NoSession then
        return l_Localization_1:getText("Errors", "NoSession");
    elseif l_GenerationErrorType_0 == v39.ServerError500 then
        return l_Localization_1:getText("Errors", "ServerError500");
    elseif l_GenerationErrorType_0 == v39.ServerError504 then
        return l_Localization_1:getText("Errors", "ServerError504");
    elseif l_GenerationErrorType_0 == v39.TextFullyFiltered then
        return l_Localization_1:getText("Errors", "TextFullyFiltered");
    elseif l_GenerationErrorType_0 == v39.NoSelectedMaterial then
        return l_Localization_1:getText("Errors", "NoSelectedMaterial");
    elseif l_GenerationErrorType_0 == v39.FailedToGenerateMaps then
        return l_Localization_1:getText("Errors", "FailedToGenerateMaps");
    elseif l_GenerationErrorType_0 == v39.TooManyRequests then
        return l_Localization_1:getText("Errors", "TooManyRequests");
    elseif l_GenerationErrorType_0 == v39.AccountingFailedDecrement then
        return l_Localization_1:getText("Errors", "AccountingFailedDecrement");
    elseif l_GenerationErrorType_0 == v39.FailedToSetImage then
        return l_Localization_1:getText("Errors", "FailedToSetImage");
    elseif l_GenerationErrorType_0 == v39.Unknown then
        return l_Localization_1:getText("Errors", "UnknownGenerationError");
    else
        error("Unknown errorType");
        return;
    end;
end;
v43 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    MaterialPreviewController = if v40() then nil else v37, 
    StudioServices = l_StudioServices_0, 
    Stylizer = l_Stylizer_0
})(v43);
local function v73(v71, _) --[[ Line: 294 ]] --[[ Name: mapStateToProps ]]
    return {
        GeneratingImages = v71.AppStateReducer.generatingImages, 
        GenerationErrorType = v71.AppStateReducer.generationError.generationErrorType, 
        GenerationErrorMessage = v71.AppStateReducer.generationError.message, 
        IsSavingMaterial = v71.AppStateReducer.isSavingMaterial, 
        Materials = v71.MaterialsReducer.materials, 
        SelectedMaterial = v71.MaterialsReducer.selectedMaterial
    };
end;
local function v84(v74) --[[ Line: 305 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v40 (copy), v18 (copy), v22 (copy), v39 (copy), v41 (copy), v24 (copy), v19 (copy), v27 (copy), v20 (copy), v21 (copy), v23 (copy), v28 (copy), v29 (copy), v26 (copy)
    return {
        dispatchClearSelectedMaterial = if v40() then nil else function() --[[ Line: 309 ]]
            -- upvalues: v74 (copy), v18 (ref)
            v74(v18());
        end, 
        dispatchCloseError = function() --[[ Line: 312 ]] --[[ Name: dispatchCloseError ]]
            -- upvalues: v74 (copy), v22 (ref), v39 (ref)
            v74(v22(v39.None, nil));
        end, 
        dispatchGenerateVariations = function(v75) --[[ Line: 315 ]] --[[ Name: dispatchGenerateVariations ]]
            -- upvalues: v41 (ref), v74 (copy), v24 (ref)
            if not v41() then
                return;
            else
                v74(v24(v75.Textures.ColorMap));
                return;
            end;
        end, 
        dispatchRemoveAllMaterials = function() --[[ Line: 322 ]] --[[ Name: dispatchRemoveAllMaterials ]]
            -- upvalues: v74 (copy), v19 (ref)
            v74(v19());
        end, 
        dispatchRemoveMaterial = function(v76) --[[ Line: 325 ]] --[[ Name: dispatchRemoveMaterial ]]
            -- upvalues: v40 (ref), v74 (copy), v27 (ref), v20 (ref)
            if v40() then
                v74(v27(v76));
                return;
            else
                v74(v20(v76));
                return;
            end;
        end, 
        dispatchSetBaseMaterial = if v40() then nil else function(v77) --[[ Line: 334 ]]
            -- upvalues: v74 (copy), v21 (ref)
            v74(v21(v77));
        end, 
        dispatchSetSelectedMaterial = function(v78) --[[ Line: 337 ]] --[[ Name: dispatchSetSelectedMaterial ]]
            -- upvalues: v74 (copy), v23 (ref)
            v74(v23(v78));
        end, 
        dispatchUpdateMaterial = v40() and function(v79) --[[ Line: 341 ]]
            -- upvalues: v74 (copy), v28 (ref)
            v74(v28(v79));
        end or nil, 
        dispatchUploadMaterial = function(v80, v81) --[[ Line: 345 ]] --[[ Name: dispatchUploadMaterial ]]
            -- upvalues: v74 (copy), v29 (ref)
            v74(v29(v80, v81));
        end, 
        dispatchApplyMaterial = function(v82, v83) --[[ Line: 348 ]] --[[ Name: dispatchApplyMaterial ]]
            -- upvalues: v74 (copy), v26 (ref)
            v74(v26(v82, v83));
        end
    };
end;
if v40() then
    return l_withAbsoluteSize_0(v5.connect(v73, v84)(v43));
else
    return v5.connect(v73, v84)(v43);
end;