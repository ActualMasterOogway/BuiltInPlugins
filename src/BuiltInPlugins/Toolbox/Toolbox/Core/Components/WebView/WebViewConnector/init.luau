local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local _ = require(l_Packages_0.Dash);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Framework);
local _ = require(l_script_FirstAncestor_0.SharedPluginConstants);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local _ = require(l_Util_0.Analytics.Analytics);
local v9 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v10 = require(l_Util_0.Analytics.Analytics);
local v11 = require(l_Util_0.Analytics.Senders);
local v12 = require(l_Util_0.Constants);
local v13 = require(l_Util_0.DebugFlags);
local _ = require(l_Util_0.getUserId);
local l_Types_0 = l_script_FirstAncestor_0.Core.Types;
local v16 = require(l_Types_0.Category);
local l_withContext_0 = v5.ContextServices.withContext;
local v18 = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v19 = v3.PureComponent:extend("WebViewConnector");
v19.init = function(v20) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy)
    v20.connectToSignal = function(v21, v22) --[[ Line: 55 ]]
        -- upvalues: v20 (copy), v13 (ref)
        local l_props_0 = v20.props;
        local v24 = l_props_0.PluginLoaderContext and l_props_0.PluginLoaderContext.signals[v21];
        if v24 then
            return v24:Connect(v22);
        else
            if v13.shouldDebugWarnings() then
                warn((("Webview signal '%*' was not connected"):format(v21)));
            end;
            return;
        end;
    end;
end;
v19.didMount = function(v25) --[[ Line: 66 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy), v10 (copy), v12 (copy), v11 (copy)
    local l_props_1 = v25.props;
    local l_categoryName_0 = l_props_1.categoryName;
    if v16.getTabKeyForCategoryName(l_categoryName_0) == v16.MARKETPLACE_KEY then
        v10.setEventTarget(v12.ANALYTICS_TARGET.Webview);
    end;
    if v25._tabChangeConnection == nil then
        v25._tabChangeConnection = v25.connectToSignal("StudioService.OnToolboxTabChange", function(v28) --[[ Line: 76 ]]
            -- upvalues: l_props_1 (copy)
            l_props_1.ChangeMarketplaceTab(v28);
        end);
    end;
    if v25._sendAnalyticsCounterEventConnection == nil then
        v25._sendAnalyticsCounterEventConnection = v25.connectToSignal("StudioService.SendAnalyticsCounterEvent", function(v29) --[[ Line: 84 ]]
            -- upvalues: v11 (ref)
            v11.reportCounter(v29.eventName, if v29.data then v29.data.amount else nil);
        end);
    end;
    if v25._sendAnalyticsEventConnection == nil then
        v25._sendAnalyticsEventConnection = v25.connectToSignal("StudioService.SendAnalyticsEvent", function(v30) --[[ Line: 93 ]]
            -- upvalues: v10 (ref), v11 (ref)
            local v31 = v10.getWebViewTrackingAttributes(v30.data);
            v11.sendEventImmediately("studio", "webview", v30.eventName, v31);
        end);
    end;
    if v25._insertAssetEventConnection == nil then
        v25._insertAssetEventConnection = v25.connectToSignal("StudioService.InsertAsset", function(v32) --[[ Line: 101 ]]
            -- upvalues: l_props_1 (copy)
            l_props_1.TryInsert(v32.assetData, v32.assetWasDragged, v32.insertionMethod, v32.swimlaneName, v32.assetVersionId);
        end);
    end;
end;
v19.willUnmount = function(v33) --[[ Line: 113 ]] --[[ Name: willUnmount ]]
    if v33._tabChangeConnection then
        v33._tabChangeConnection:Disconnect();
        v33._tabChangeConnection = nil;
    end;
    if v33._sendAnalyticsCounterEventConnection then
        v33._sendAnalyticsCounterEventConnection:Disconnect();
        v33._sendAnalyticsCounterEventConnection = nil;
    end;
    if v33._sendAnalyticsEventConnection then
        v33._sendAnalyticsEventConnection:Disconnect();
        v33._sendAnalyticsEventConnection = nil;
    end;
    if v33._insertAssetEventConnection then
        v33._insertAssetEventConnection:Disconnect();
        v33._insertAssetEventConnection = nil;
    end;
end;
v19.render = function(v34) --[[ Line: 135 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local _ = v34.props;
    return v3.createElement("Frame", {});
end;
v19 = l_withContext_0({
    AssetAnalytics = v9
})(v19);
v19 = v4.connect(function(v36, _) --[[ Line: 144 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v16 (copy)
    return {
        categoryName = ((v36 or {}).pageInfo or {}).categoryName or v16.DEFAULT.name
    };
end, nil)(v19);
TypedComponent = function(v38, v39) --[[ Line: 154 ]] --[[ Name: TypedComponent ]]
    -- upvalues: v3 (copy), v19 (ref)
    return v3.createElement(v19, v38, v39);
end;
return v18(TypedComponent);