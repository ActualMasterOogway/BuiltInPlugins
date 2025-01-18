local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
local v4 = v2.Store.new(v3, nil, {
    v2.thunkMiddleware
});
local v5 = require(l_Parent_0.Src.Resources.makeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local v8 = l_ContextServices_0.Localization.new({
    stringResourceTable = l_SourceStrings_0, 
    translationResourceTable = l_LocalizedStrings_0, 
    pluginName = "PluginInstallation"
});
local v9 = require(l_Parent_0.Packages.Http);
local v10 = v9.API.new({
    networking = v9.Networking.new({
        isInternal = true, 
        loggingLevel = 0
    })
});
local v11 = require(l_Parent_0.Src.Util.getAnalyticsContextItem)();
local v12 = nil;
return function(v13) --[[ Line: 48 ]]
    -- upvalues: v12 (ref), v8 (copy), v5 (copy), v4 (copy), v10 (copy), v11 (copy)
    if v12 ~= nil then
        return v12;
    else
        assert(v13 ~= nil, "getPluginGlobals hasn't been initialized yet");
        v12 = {
            plugin = v13, 
            localization = v8, 
            theme = v5, 
            store = v4, 
            api = v10, 
            mouse = v13:GetMouse(), 
            focusGui = {}, 
            analytics = v11
        };
        return v12;
    end;
end;