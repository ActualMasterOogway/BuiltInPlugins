local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v4 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioScroller);
local _ = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v6 = require(l_script_FirstAncestor_0.Core.ContextServices.NavigationContext);
local v7 = require(l_script_FirstAncestor_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local l_Pane_0 = v2.UI.Pane;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
return function(v10) --[[ Line: 24 ]] --[[ Name: AudioScrollerWrapper ]]
    -- upvalues: v6 (copy), v7 (copy), v1 (copy), l_Stylizer_0 (copy), l_Pane_0 (copy), v4 (copy)
    local l_ResultsState_0 = v10.ResultsState;
    local l_LogAssetImpression_0 = v10.AssetLogicWrapperProps.LogAssetImpression;
    local v13 = v6.use();
    local v14 = v7.use();
    local v15, v16 = v1.useState({
        size = Vector2.zero, 
        position = Vector2.zero
    });
    local v24 = v1.useCallback(function(v17, v18, v19, v20) --[[ Line: 37 ]]
        -- upvalues: l_LogAssetImpression_0 (copy), v10 (copy), v13 (copy), v14 (copy), v15 (copy)
        if l_LogAssetImpression_0 then
            local l_SwimlaneName_0 = v10.SwimlaneName;
            local v22 = v13:get();
            local v23 = v14:get().getNavigationContext(v22, l_SwimlaneName_0);
            return l_LogAssetImpression_0(v17, v20, v18, v19, v15.size, v15.position, v23);
        else
            return nil;
        end;
    end, {
        l_LogAssetImpression_0, 
        v15
    });
    local v26 = v1.useCallback(function(v25) --[[ Line: 65 ]]
        -- upvalues: v16 (copy)
        v16({
            size = v25.AbsoluteSize, 
            position = v25.AbsolutePosition
        });
    end, {});
    local v27 = l_Stylizer_0:use();
    return v1.createElement(l_Pane_0, {
        BackgroundColor = v27.backgroundColor, 
        [v1.Change.AbsoluteSize] = v26, 
        [v1.Change.AbsolutePosition] = v26
    }, {
        AudioScroller = v4.Generator({
            Assets = l_ResultsState_0.assets, 
            RenderTopContent = v10.RenderTopContent, 
            PageSize = v10.PageSize, 
            FetchNextPage = l_ResultsState_0.fetchNextPage, 
            Loading = l_ResultsState_0.loading, 
            ParentAbsoluteSize = v15.size, 
            ParentAbsolutePosition = v15.position, 
            CanInsertAsset = v10.AssetLogicWrapperProps.CanInsertAsset, 
            LogImpression = v24, 
            OnAssetPreviewButtonClicked = v10.AssetLogicWrapperProps.OnAssetPreviewButtonClicked, 
            TryInsert = v10.AssetLogicWrapperProps.TryInsert, 
            TryOpenAssetConfig = v10.AssetLogicWrapperProps.TryOpenAssetConfig, 
            SwimlaneName = v10.SwimlaneName
        })
    });
end;