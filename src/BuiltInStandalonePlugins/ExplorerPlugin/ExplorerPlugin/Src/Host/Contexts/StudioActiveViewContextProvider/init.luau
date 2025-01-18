local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useFocusedDataModelType);
local l_createElement_0 = v2.createElement;
return function(v5) --[[ Line: 9 ]] --[[ Name: StudioActiveViewContext ]]
    -- upvalues: v3 (copy), l_createElement_0 (copy), v1 (copy)
    local v6 = v3();
    return l_createElement_0(v1.Components.Contexts.ActiveViewContextProvider, {
        activeViewIdentifier = v6 and v6.Name
    }, v5.children);
end;