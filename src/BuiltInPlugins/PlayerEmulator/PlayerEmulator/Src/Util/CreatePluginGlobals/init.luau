local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Packages.Http);
local v4 = require(l_Parent_0.Src.ContextServices.NetworkingContext);
local v5 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local v8 = require(l_Parent_0.Src.Reducers.createMainReducer);
local v9 = l_ContextServices_0.Localization.new({
    stringResourceTable = l_SourceStrings_0, 
    translationResourceTable = l_LocalizedStrings_0, 
    pluginName = "PlayerEmulator"
});
local v10 = v1.Store.new(v8(), nil, {
    v1.thunkMiddleware
});
local v11 = v3.Networking.new({
    isInternal = true, 
    loggingLevel = 0
});
return {
    theme = v5(), 
    localization = v9, 
    store = l_ContextServices_0.Store.new(v10), 
    networking = v4.new(v11)
};