local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_TextService_0 = game:GetService("TextService");
local l_PermissionsService_0 = game:GetService("PermissionsService");
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.FitFrame);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local v9 = require(l_Parent_0.Src.Thunks.SetPluginPermission);
local v10 = require(l_Parent_0.Src.Components.FluidFitTextLabel);
local v11 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local l_FitFrameVertical_0 = v5.FitFrameVertical;
local v13 = require(l_Parent_0.Src.Util.Constants);
local l_Checkbox_0 = l_UI_0.Checkbox;
local v15 = require(l_Parent_0.Src.Util.truncateMiddleText);
local v16 = v3.Component:extend("HttpRequestHolder");
v16.defaultProps = {
    httpPermissions = {}
};
v16.init = function(v17) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_TextService_0 (copy), v13 (copy), v15 (copy)
    v17.frameRef = v3.createRef();
    v17.state = {
        frameWidth = 0
    };
    v17.onCheckboxActivated = function(v18) --[[ Line: 41 ]]
        -- upvalues: v17 (copy)
        local v19 = v17.props.API:get();
        local l_assetId_0 = v17.props.assetId;
        return v17.props.setPluginPermission(v19, l_assetId_0, v18);
    end;
    v17.resizeFrame = function() --[[ Line: 47 ]]
        -- upvalues: v17 (copy)
        local l_current_0 = v17.frameRef.current;
        if not l_current_0 then
            return;
        else
            if v17.state.frameWidth ~= l_current_0.AbsoluteSize.X then
                v17:setState({
                    frameWidth = l_current_0.AbsoluteSize.X
                });
            end;
            return;
        end;
    end;
    v17.getTruncatedText = function(v22, v23) --[[ Line: 59 ]]
        -- upvalues: l_TextService_0 (ref), v17 (copy), v13 (ref), v15 (ref)
        local _ = "";
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v22, 16, v23.Font, Vector2.new());
        local v26 = v17.state.frameWidth - 16 - v13.SCROLLBAR_WIDTH_ADJUSTMENT;
        if v26 > 0 and v26 < l_l_TextService_0_TextSize_0.X then
            return (v15(v22, 16, v23.Font, v26));
        else
            return v22;
        end;
    end;
end;
v16.didMount = function(v27) --[[ Line: 78 ]] --[[ Name: didMount ]]
    v27.resizeFrame();
end;
v16.renderCheckbox = function(v28, v29, v30, v31) --[[ Line: 82 ]] --[[ Name: renderCheckbox ]]
    -- upvalues: v3 (copy), l_Checkbox_0 (copy)
    local v32 = v31.data and v31.data.domain or "";
    local v33 = v28.getTruncatedText(v32, v29);
    local l_allowed_0 = v31.allowed;
    return v3.createElement(l_Checkbox_0, {
        Checked = l_allowed_0, 
        LayoutOrder = v30, 
        OnClick = function() --[[ Line: 90 ]] --[[ Name: OnClick ]]
            -- upvalues: v28 (copy), v31 (copy)
            v28.onCheckboxActivated(v31);
        end, 
        Text = v33
    });
end;
v16.render = function(v35) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_FitFrameVertical_0 (copy), v10 (copy)
    local l_Localization_0 = v35.props.Localization;
    local l_httpPermissions_0 = v35.props.httpPermissions;
    local l_LayoutOrder_0 = v35.props.LayoutOrder;
    local l_Stylizer_0 = v35.props.Stylizer;
    local v40 = {};
    for v41, v42 in pairs(l_httpPermissions_0) do
        table.insert(v40, v35:renderCheckbox(l_Stylizer_0, v41, v42));
    end;
    return v3.createElement(l_FitFrameVertical_0, {
        BackgroundTransparency = 1, 
        contentPadding = UDim.new(0, 20), 
        LayoutOrder = l_LayoutOrder_0, 
        width = UDim.new(1, 0), 
        [v3.Ref] = v35.frameRef, 
        [v3.Change.AbsoluteSize] = v35.resizeFrame
    }, {
        Checkboxes = v3.createElement(l_FitFrameVertical_0, {
            BackgroundTransparency = 1, 
            contentPadding = UDim.new(0, 8), 
            LayoutOrder = 0, 
            width = UDim.new(1, 0)
        }, v40), 
        InfoText = v3.createElement(v10, {
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            LayoutOrder = 1, 
            TextSize = 16, 
            Text = l_Localization_0:getText("Details", "HttpRequestInfo"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Stylizer_0.InfoTextColor
        })
    });
end;
v16 = l_withContext_0({
    API = v11, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v16);
return v4.connect(nil, function(v43) --[[ Line: 142 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), l_PermissionsService_0 (copy)
    return {
        setPluginPermission = function(v44, v45, v46) --[[ Line: 144 ]] --[[ Name: setPluginPermission ]]
            -- upvalues: v43 (copy), v9 (ref), l_PermissionsService_0 (ref)
            v43(v9(l_PermissionsService_0, v44, v45, v46));
        end
    };
end)(v16);