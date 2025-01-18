local v0 = require(script.Classes.PluginDebugInterface);
local v1 = require(script.Classes.CoreGuiDebugInterface);
local v2 = require(script.Classes.StandalonePluginDebugInterface);
local v3 = require(script.Classes.LibraryDebugInterface);
local v4 = require(script.Classes.InspectorDebugInterface);
local v5 = require(script.RoactInspector.Classes.RoactInspectorApi);
return {
    forPlugin = function(v6, v7) --[[ Line: 26 ]] --[[ Name: forPlugin ]]
        -- upvalues: v0 (copy)
        assert(typeof(v6) == "string", ("%s must be a string, did you write DeveloperTools:%s() instead of DeveloperTools.%s() by mistake?"):format(v6, "forPlugin", "forPlugin"));
        assert(v7, "DeveloperTools:forPlugin() expected plugin for argument #2");
        return v0.new(v6, v7);
    end, 
    forStandalonePlugin = function(v8, v9, v10) --[[ Line: 32 ]] --[[ Name: forStandalonePlugin ]]
        -- upvalues: v2 (copy)
        assert(typeof(v8) == "string", ("%s must be a string, did you write DeveloperTools:%s() instead of DeveloperTools.%s() by mistake?"):format(v8, "forStandalonePlugin", "forStandalonePlugin"));
        assert(v9, "DeveloperTools:forStandalonePlugin() expected plugin for argument #2");
        return v2.new(v8, v9, v10);
    end, 
    forCoreGui = function(v11, v12) --[[ Line: 38 ]] --[[ Name: forCoreGui ]]
        -- upvalues: v1 (copy)
        assert(typeof(v11) == "string", ("%s must be a string, did you write DeveloperTools:%s() instead of DeveloperTools.%s() by mistake?"):format(v11, "appName", "appName"));
        return v1.new(v11, v12);
    end, 
    forLibrary = function(v13, v14) --[[ Line: 44 ]] --[[ Name: forLibrary ]]
        -- upvalues: v3 (copy)
        assert(typeof(v13) == "string", ("%s must be a string, did you write DeveloperTools:%s() instead of DeveloperTools.%s() by mistake?"):format(v13, "libraryName", "libraryName"));
        return v3.new(v13, v14);
    end, 
    forInspector = function(v15) --[[ Line: 49 ]] --[[ Name: forInspector ]]
        -- upvalues: v4 (copy)
        return v4.new(v15);
    end, 
    RoactInspectorApi = v5
};