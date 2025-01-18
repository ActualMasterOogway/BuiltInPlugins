local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Enums.Theme);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local v4 = require(l_script_FirstAncestor_0.Providers.Foundation);
local _ = require(l_script_FirstAncestor_0.Providers.Preferences.PreferencesProvider);
return function(v6, v7) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v4, {
        theme = v2.Dark, 
        preferences = v7
    }, {
        Content = v1.createElement(v3, {
            Size = UDim2.new(1, 0, 1, 0)
        }, v6)
    });
end;