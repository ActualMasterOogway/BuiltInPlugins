local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v5 = require(l_Parent_0.Src.Reducers.MainReducer);
local v6 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v8 = require(l_Controllers_0.GeneralServiceController);
local v9 = require(l_Controllers_0.ImageLoader);
local v10 = require(l_Controllers_0.ImageUploader);
local v11 = require(l_Controllers_0.ImportAssetHandler);
local v12 = require(l_Controllers_0.MaterialServiceController);
local v13 = require(l_Controllers_0.PluginController);
local v14 = l_ContextServices_0.Store.new(v1.Store.new(v5, nil, {
    v1.thunkMiddleware
}, nil));
local v15 = v10.new();
local v16 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v14, 
    v8.mock(), 
    v11.mock(v15), 
    v9.mock(), 
    v12.mock(v14.store), 
    v13.mock(), 
    v6(true)
};
return function(v17) --[[ Line: 44 ]]
    -- upvalues: l_TestHelpers_0 (copy), v16 (copy)
    assert(type(v17) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v16, v17);
end;