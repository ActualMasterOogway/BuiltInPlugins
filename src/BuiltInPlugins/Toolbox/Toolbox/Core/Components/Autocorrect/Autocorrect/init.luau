local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local _ = l_script_FirstAncestor_0.Core.Util;
local v3 = require(l_script_FirstAncestor_0.Core.Util.Colors);
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Packages_0.Framework);
local v7 = require(l_script_FirstAncestor_0.Core.Networking.Requests.RequestSearchRequest);
local v8 = require(l_script_FirstAncestor_0.Core.Types.AutocorrectTypes);
local v9 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v10 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v11 = require(l_script_FirstAncestor_0.Core.Thunks.LogMarketplaceSearchAnalytics);
local l_LayoutOrderIterator_0 = v6.Util.LayoutOrderIterator;
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LinkText_0 = v6.UI.LinkText;
local l_Pane_0 = v6.UI.Pane;
local l_TextLabel_0 = v6.UI.TextLabel;
local v18 = v4.PureComponent:extend("Autocorrect");
v18.init = function(v19) --[[ Line: 45 ]] --[[ Name: init ]]
    v19.onClickOfferedQuery = function(v20, v21, v22, v23) --[[ Line: 46 ]]
        -- upvalues: v19 (copy)
        local l_networkInterface_0 = v19.props.Network.networkInterface;
        local v25 = v19.props.Settings:get("Plugin");
        v19.props.requestSearchRequest(l_networkInterface_0, v25, v20, v21, v22, v23);
        v19.props.logSearchAnalytics(v20, v21, v22, v23);
    end;
end;
v18.render = function(v26) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v3 (copy), l_LayoutOrderIterator_0 (copy), v4 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy)
    local l_props_0 = v26.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_CorrectionState_0 = l_props_0.CorrectionState;
    local l_CurrentQuery_0 = l_props_0.CurrentQuery;
    local l_CorrectedQuery_0 = l_props_0.CorrectedQuery;
    local l_UserQuery_0 = l_props_0.UserQuery;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    if l_CorrectionState_0 == v8.AutocorrectResponseState.CorrectionAvailable then
        v33 = "DidYouMean";
        v34 = v8.QuerySource.CorrectedQuery;
        v35 = l_CurrentQuery_0;
        v38 = l_CorrectedQuery_0;
        v37 = v3.WARNING_TEXT_COLOR;
    elseif l_CorrectionState_0 == v8.AutocorrectResponseState.CorrectionAccepted then
        v33 = "SearchInsteadFor";
        v34 = v8.QuerySource.ReversionToUserQuery;
        v36 = l_CurrentQuery_0;
        v38 = l_UserQuery_0;
    else
        return nil;
    end;
    local v39 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        VerticalAlignment = Enum.VerticalAlignment.Top
    };
    local v40 = l_LayoutOrderIterator_0.new();
    return v4.createElement(l_Pane_0, v39, {
        Message = v4.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v40:getNextOrder(), 
            Text = l_Localization_0:getText("General", v33) .. " ", 
            TextColor = v37
        }), 
        Suggestion = v4.createElement(l_LinkText_0, {
            LayoutOrder = v40:getNextOrder(), 
            Text = v38, 
            OnClick = function() --[[ Line: 118 ]] --[[ Name: OnClick ]]
                -- upvalues: v26 (copy), v38 (ref), v34 (ref), v35 (ref), v36 (ref)
                v26.onClickOfferedQuery(v38, v34, v35, v36);
            end
        })
    });
end;
v18 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v9, 
    Plugin = l_ContextServices_0.Plugin, 
    Settings = v10, 
    Stylizer = l_ContextServices_0.Stylizer
})(v18);
return (v5.connect(nil, function(v41) --[[ Line: 133 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v7 (copy)
    return {
        logSearchAnalytics = function(v42, v43, v44, v45) --[[ Line: 135 ]] --[[ Name: logSearchAnalytics ]]
            -- upvalues: v41 (copy), v11 (ref)
            v41(v11(v42, false, v43, v44, v45));
        end, 
        requestSearchRequest = function(v46, v47, v48, v49, v50, v51) --[[ Line: 138 ]] --[[ Name: requestSearchRequest ]]
            -- upvalues: v41 (copy), v7 (ref)
            v41(v7(v46, v47, v48, nil, false, v49, v50, v51));
        end
    };
end)(v18));