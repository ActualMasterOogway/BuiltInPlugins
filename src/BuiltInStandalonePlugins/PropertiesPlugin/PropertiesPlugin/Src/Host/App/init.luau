local l_script_FirstAncestor_0 = script:FindFirstAncestor("PropertiesPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v3 = require(l_script_FirstAncestor_0.Packages.Properties);
local v4 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioNetworkContextProvider);
local v5 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioActiveViewContextProvider);
local v6 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioThemeContextProvider);
local l_createElement_0 = v1.createElement;
return function() --[[ Line: 13 ]] --[[ Name: App ]]
    -- upvalues: l_createElement_0 (copy), v2 (copy), v4 (copy), v5 (copy), v6 (copy), v3 (copy)
    return l_createElement_0(v2.ContextStack, {
        providers = {
            l_createElement_0(v4), 
            l_createElement_0(v5), 
            l_createElement_0(v6)
        }
    }, {
        MainView = l_createElement_0(v3.Components.MainView)
    });
end;