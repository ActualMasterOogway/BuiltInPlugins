local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SectionHeader);
local v5 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioTable);
local v6 = require(l_script_FirstAncestor_0.Core.Components.NoSceneSuggestions);
local _ = require(l_script_FirstAncestor_0.Core.Types.AudioTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v9 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local v10 = require(l_script_FirstAncestor_0.Core.ContextServices.NavigationContext);
local v11 = require(l_script_FirstAncestor_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LoadingIndicator_0 = v2.UI.LoadingIndicator;
local l_Pane_0 = v2.UI.Pane;
return function(v15) --[[ Line: 27 ]] --[[ Name: AudioSort ]]
    -- upvalues: v9 (copy), l_Stylizer_0 (copy), v1 (copy), v10 (copy), v11 (copy), v4 (copy), v5 (copy), v3 (copy), v6 (copy), l_LoadingIndicator_0 (copy), l_Pane_0 (copy)
    local v16 = v9.new();
    local l_ResultsState_0 = v15.AudioSection.ResultsState;
    local l_name_0 = v15.AudioSection.Section.name;
    local v19 = l_Stylizer_0:use();
    local l_LogAssetImpression_0 = v15.AssetLogicWrapperProps.LogAssetImpression;
    local v21 = v1.useRef(nil);
    local v22 = v10.use();
    local v23 = v11.use();
    local v30 = v1.useCallback(function(v24, v25, v26, v27) --[[ Line: 39 ]]
        -- upvalues: l_LogAssetImpression_0 (copy), v21 (copy), v22 (copy), v23 (copy), l_name_0 (copy)
        if l_LogAssetImpression_0 and v21.current then
            local v28 = v22:get();
            local v29 = v23:get().getNavigationContext(v28, l_name_0);
            return l_LogAssetImpression_0(v24, v27, v25, v26, v21.current.AbsoluteSize, v21.current.AbsolutePosition, v29);
        else
            return nil;
        end;
    end, {
        l_LogAssetImpression_0
    });
    local v31 = {
        Header = v1.createElement(v4, {
            LayoutOrder = v16:getNextOrder(), 
            Title = v15.AudioSection.Section.displayName, 
            OnClickSeeAll = v15.OnSeeAllActivated
        })
    };
    if l_ResultsState_0 and not l_ResultsState_0.loading then
        if #l_ResultsState_0.assets > 0 then
            v31.AudioTable = v5.Generator({
                LayoutOrder = v16:getNextOrder(), 
                Assets = l_ResultsState_0.assets, 
                LogImpression = v30, 
                CanInsertAsset = v15.AssetLogicWrapperProps.CanInsertAsset, 
                OnAssetPreviewButtonClicked = v15.AssetLogicWrapperProps.OnAssetPreviewButtonClicked, 
                TryInsert = v15.AssetLogicWrapperProps.TryInsert, 
                TryOpenAssetConfig = v15.AssetLogicWrapperProps.TryOpenAssetConfig, 
                SwimlaneName = l_name_0
            });
        elseif v15.AudioSection.Section.name == v3.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then
            v31.NoSceneSuggestions = v1.createElement(v6, {
                LayoutOrder = v16:getNextOrder()
            });
        end;
    else
        v31.Loading = v1.createElement(l_LoadingIndicator_0, {
            LayoutOrder = v16:getNextOrder()
        });
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v15.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v19.spacingUnit, 
        ref = v21
    }, v31);
end;