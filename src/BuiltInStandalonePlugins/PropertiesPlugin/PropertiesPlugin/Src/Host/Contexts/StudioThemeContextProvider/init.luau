local l_script_FirstAncestor_0 = script:FindFirstAncestor("PropertiesPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Properties);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_createElement_0 = v2.createElement;
local function v5() --[[ Line: 9 ]] --[[ Name: getStudioThemeName ]]
    return settings().Studio.Theme.Name;
end;
return function(v6) --[[ Line: 13 ]] --[[ Name: StudioThemeContextProvider ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), l_createElement_0 (copy), v1 (copy)
    local v7, v8 = v2.useState(v5);
    v3.useEventConnection(settings().Studio.ThemeChanged, function() --[[ Line: 18 ]]
        -- upvalues: v8 (copy), v5 (ref)
        v8(v5);
    end, {});
    return l_createElement_0(v1.Components.Contexts.ThemeContextProvider, {
        theme = v7
    }, v6.children);
end;