local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = v3.UI.LoadingIndicator;
local v12 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioTable);
local _ = require(l_script_FirstAncestor_0.Core.Components.StyledScrollingFrame);
local v14 = require(l_script_FirstAncestor_0.Core.Components.LoadScroller);
local v15 = v2.PureComponent:extend("AudioScroller");
v15.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    PageSize = 20
};
v15.init = function(v16, _) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v16.calculateCanvasHeight = function(_) --[[ Line: 66 ]]
        -- upvalues: v16 (copy), v5 (ref)
        local _ = v16.props;
        local v20 = #v16.props.Assets;
        local v21 = v16.props.Loading and 60 or 0;
        local v22 = v16.props.RenderTopContent and 30 or 0;
        return v5.AUDIO_ROW.ROW_HEIGHT * v20 + v21 + v22 + v5.AUDIO_ROW.EXPANDED_ROW_HEIGHT;
    end;
end;
v15.render = function(v23) --[[ Line: 79 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v2 (copy), v14 (copy)
    local l_props_1 = v23.props;
    local _ = v23.state;
    local function v26() --[[ Line: 83 ]]
        -- upvalues: v12 (ref), l_props_1 (copy)
        return v12.Generator({
            AudioType = l_props_1.AudioType, 
            Assets = l_props_1.Assets, 
            TryInsert = l_props_1.TryInsert, 
            CanInsertAsset = l_props_1.CanInsertAsset, 
            LayoutOrder = 2, 
            LogImpression = l_props_1.LogImpression, 
            OnAssetPreviewButtonClicked = l_props_1.OnAssetPreviewButtonClicked, 
            ParentAbsoluteSize = l_props_1.ParentAbsoluteSize, 
            TryOpenAssetConfig = l_props_1.TryOpenAssetConfig, 
            SwimlaneName = l_props_1.SwimlaneName
        });
    end;
    return v2.createElement(v14, {
        CalculateCanvasHeight = v23.calculateCanvasHeight, 
        FetchNextPage = l_props_1.FetchNextPage, 
        Items = l_props_1.Assets, 
        Loading = l_props_1.Loading, 
        PageSize = l_props_1.PageSize, 
        Position = l_props_1.Position, 
        RenderContent = v26, 
        RenderTopContent = l_props_1.RenderTopContent, 
        Size = l_props_1.Size, 
        Total = l_props_1.Total
    });
end;
v15 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15);
TypedAudioScroller = function(v27, v28) --[[ Line: 117 ]] --[[ Name: TypedAudioScroller ]]
    -- upvalues: v2 (copy), v15 (ref)
    return v2.createElement(v15, v27, v28);
end;
return {
    Component = v15, 
    Generator = TypedAudioScroller
};