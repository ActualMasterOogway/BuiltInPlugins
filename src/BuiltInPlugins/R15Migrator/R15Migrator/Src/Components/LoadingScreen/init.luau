local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local l_Status_0 = require(l_AnimationConversion_0.constants).Status;
local v12 = v2.PureComponent:extend("LoadingScreen");
v12.init = function(v13) --[[ Line: 19 ]] --[[ Name: init ]]
    local l_StartScan_0 = v13.props.StartScan;
    task.spawn(function() --[[ Line: 23 ]]
        -- upvalues: l_StartScan_0 (copy)
        wait(1);
        l_StartScan_0();
    end);
end;
v12.render = function(v15) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_Status_0 (copy), l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_LoadingIndicator_0 (copy)
    local l_props_0 = v15.props;
    local l_status_0 = l_props_0.status;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v20 = "";
    if l_status_0 == l_Status_0.ScanningScripts or l_status_0 == l_Status_0.ScanningWorkspace or l_status_0 == l_Status_0.ConvertingAnimations then
        v20 = l_Localization_0:getText("AnimationConversion", l_status_0);
    end;
    local v21 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Stylizer_0.Spacing, 
        Padding = l_Stylizer_0.Padding
    }, {
        Text = v2.createElement(l_TextLabel_0, {
            Text = v20, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v21:getNextOrder()
        }), 
        LoadingIndicator = v2.createElement(l_LoadingIndicator_0, {
            LayoutOrder = v21:getNextOrder()
        })
    });
end;
v12 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v12);
return v3.connect(function(v22, _) --[[ Line: 69 ]] --[[ Name: mapStateToProps ]]
    return {
        status = v22.AnimationConversion.status
    };
end)(v12);