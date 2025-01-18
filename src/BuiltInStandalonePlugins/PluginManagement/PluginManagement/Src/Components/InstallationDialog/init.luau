local _ = Vector2.new(400, 217);
local _ = Vector2.new(120, 32);
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages.Cryo);
local v6 = require(l_Parent_0.Src.Constants.PluginInstalledStatus);
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = l_ContextServices_0.Localization;
local l_StyledDialog_0 = v7.UI.StyledDialog;
local v12 = v3.PureComponent:extend("InstallationDialog");
v12.init = function(v13) --[[ Line: 33 ]] --[[ Name: init ]]
    v13.state = {
        hasDataLoaded = false
    };
end;
v12.didUpdate = function(v14) --[[ Line: 39 ]] --[[ Name: didUpdate ]]
    -- upvalues: v6 (copy)
    local v15 = v14.props.info.installStatus ~= v6.UNKNOWN;
    local v16 = v14.state.hasDataLoaded == false;
    if v15 and v16 then
        spawn(function() --[[ Line: 50 ]]
            -- upvalues: v14 (copy)
            v14:setState({
                hasDataLoaded = true
            });
        end);
    end;
end;
v12.render = function(v17) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_StyledDialog_0 (copy)
    local l_hasDataLoaded_0 = v17.state.hasDataLoaded;
    local l_Localization_1 = v17.props.Localization;
    local l_OnClose_0 = v17.props.OnClose;
    local l_OnButtonClicked_0 = v17.props.OnButtonClicked;
    return l_hasDataLoaded_0 and v3.createElement(l_StyledDialog_0, {
        Title = l_Localization_1:getText("DialogTitle", "InstallPlugin"), 
        Buttons = {
            {
                Key = true, 
                Text = l_Localization_1:getText("Dialog", "Ok"), 
                Style = "RoundPrimary"
            }
        }, 
        Resizable = false, 
        MinContentSize = Vector2.new(400, 120), 
        OnButtonPressed = l_OnButtonClicked_0, 
        OnClose = l_OnClose_0
    }, v17.props[v3.Children]);
end;
v12 = l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v12);
return v4.connect(function(v22, v23) --[[ Line: 87 ]]
    local l_pluginId_0 = v23.pluginId;
    return {
        info = v22.PluginInfo.plugins[l_pluginId_0]
    };
end)(v12);