local l_DebugDisableLocalUGCValidation_0 = game:GetFastFlag("DebugDisableLocalUGCValidation");
local l_StudioService_0 = game:GetService("StudioService");
local l_ToolboxAdjustValidationReasonSize_0 = game:GetFastFlag("ToolboxAdjustValidationReasonSize");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local l_ScrollingFrame_0 = require(l_Packages_0.Framework).UI.ScrollingFrame;
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local v10 = require(l_Util_0.AssetConfigConstants);
local v11 = require(l_Util_0.AssetConfigUtil);
local v12 = require(l_Util_0.fixUpPreValidation);
local v13 = require(l_Util_0.getUGCValidationRestrictedUserTable);
local v14 = require(l_Packages_0.UGCValidation);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v18 = require(l_Actions_0.SetCurrentScreen);
local l_Components_0 = l_Parent_0.Core.Components;
local v20 = require(l_Components_0.AssetConfiguration.LoadingBarWrapper);
local v21 = require(l_Components_0.AssetConfiguration.AssetThumbnailPreview);
local v22 = require(l_Components_0.NavButton);
local v23 = l_ToolboxAdjustValidationReasonSize_0 and 600 or 400;
local v24 = l_ToolboxAdjustValidationReasonSize_0 and 400 or 72;
local v25 = v5.PureComponent:extend("AssetValidation");
v25.init = function(v26, _) --[[ Line: 83 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), l_DebugDisableLocalUGCValidation_0 (copy), l_StudioService_0 (copy), v11 (copy), v14 (copy), v13 (copy)
    v26.state = {
        failed = false, 
        isLoading = true
    };
    local function v34(v28) --[[ Line: 89 ]] --[[ Name: fixInstances ]]
        -- upvalues: v12 (ref)
        local v29 = {};
        local v30 = v28 or {};
        for v31, v32 in v30 do
            local v33 = v32:Clone();
            v12(v33);
            v29[v31] = v33;
        end;
        return v29;
    end;
    if not (l_DebugDisableLocalUGCValidation_0 and l_StudioService_0:HasInternalPermission()) and v11.isCatalogAsset(v26.props.assetTypeEnum) then
        local function v37(v35, v36) --[[ Line: 101 ]]
            -- upvalues: v26 (copy)
            if v35 then
                v26:setState({
                    onFinish = v26.props.nextScreen
                });
                return;
            else
                v26:setState({
                    onFinish = function() --[[ Line: 106 ]] --[[ Name: onFinish ]]
                        -- upvalues: v26 (ref), v36 (copy)
                        v26:setState({
                            isLoading = false, 
                            reasons = v36
                        });
                    end
                });
                return;
            end;
        end;
        if Enum.AssetType.DynamicHead == v26.props.assetTypeEnum then
            v14.validateAsyncMeshPartFormat(v34(v26.props.instances), v26.props.assetTypeEnum, v37, false, false, v13());
            return;
        else
            v14.validateAsync(v34(v26.props.instances), v26.props.assetTypeEnum, v37, false, false, v13());
            return;
        end;
    else
        v26.props.nextScreen();
        return;
    end;
end;
v25.render = function(v38) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: l_ToolboxAdjustValidationReasonSize_0 (copy), v5 (copy), v21 (copy), v20 (copy), v9 (copy), v23 (copy), v24 (copy), l_ScrollingFrame_0 (copy), v22 (copy)
    local l_props_0 = v38.props;
    local l_state_0 = v38.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v42 = "Reason:\n" .. if l_ToolboxAdjustValidationReasonSize_0 then table.concat(v38.state.reasons or {}, "\n\n") else table.concat(v38.state.reasons or {}, "\n");
    return v5.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.typeValidation.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        Preview = v5.createElement(v21, {
            titleHeight = 24, 
            titlePadding = 12, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186)
        }), 
        LoadingBar = v38.state.isLoading and v5.createElement(v20, {
            loadingText = "Validating", 
            loadingTime = 0.5, 
            holdPercent = 0.92, 
            Size = UDim2.new(0, 400, 0, 6), 
            Position = UDim2.new(0.5, -200, 0, 314), 
            onFinish = l_state_0.onFinish
        }), 
        LoadingResult = not v38.state.isLoading and v5.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 279), 
            Size = UDim2.new(1, 0, 1, -279), 
            BackgroundTransparency = 1
        }, {
            Title = v5.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v9.FONT, 
                Position = UDim2.new(0.5, -200, 0, 0), 
                Size = UDim2.new(0, 400, 0, 36), 
                Text = "Validation Failed", 
                TextColor3 = l_Stylizer_0.loading.text, 
                TextSize = v9.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            Reason = not l_ToolboxAdjustValidationReasonSize_0 and v5.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v9.FONT, 
                Position = UDim2.new(0.5, -v23 / 2, 0, 49), 
                Size = UDim2.new(0, v23, 0, v24), 
                Text = v42, 
                TextWrapped = true, 
                TextColor3 = l_Stylizer_0.loading.text, 
                TextSize = v9.FONT_SIZE_MEDIUM, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            ScrollingFrame = l_ToolboxAdjustValidationReasonSize_0 and v5.createElement(l_ScrollingFrame_0, {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, -v23 / 2, 0, 49), 
                Size = UDim2.new(0, v23, 1, -111), 
                CanvasSize = UDim2.new(0, v23, 0, v24)
            }, {
                Reason = v5.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v9.FONT, 
                    Position = UDim2.new(0.5, -v23 / 2, 0, 49), 
                    Size = UDim2.new(0, v23, 0, v24), 
                    Text = v42, 
                    TextWrapped = true, 
                    TextColor3 = l_Stylizer_0.loading.text, 
                    TextSize = v9.FONT_SIZE_MEDIUM, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            })
        }), 
        Footer = not v38.state.isLoading and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -62), 
            Size = UDim2.new(1, 0, 0, 62)
        }, {
            CloseButton = v5.createElement(v22, {
                onClick = l_props_0.onClose, 
                titleText = "Close", 
                LayoutOrder = 0, 
                Position = UDim2.new(0.5, -60, 0.5, -16), 
                Size = UDim2.new(0, 120, 0, 32)
            })
        })
    });
end;
local function v45(v43, _) --[[ Line: 240 ]] --[[ Name: mapStateToProps ]]
    v43 = v43 or {};
    return {
        instances = v43.instances, 
        assetTypeEnum = v43.assetTypeEnum
    };
end;
local function v47(v46) --[[ Line: 249 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v10 (copy)
    return {
        nextScreen = function() --[[ Line: 251 ]] --[[ Name: nextScreen ]]
            -- upvalues: v46 (copy), v18 (ref), v10 (ref)
            v46(v18(v10.SCREENS.CONFIGURE_ASSET));
        end
    };
end;
v25 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v25);
return v6.connect(v45, v47)(v25);