local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Components.Contexts.ActiveViewContext);
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.SessionView);
local v5 = require(l_script_FirstAncestor_0.Networking.useServe);
local v6 = require(l_script_FirstAncestor_0.Networking.useSessions);
local v7 = require(l_script_FirstAncestor_0.Hooks.useStyleSheet);
local l_Pane_0 = v2.UI.Pane;
local l_createElement_0 = v3.createElement;
return function() --[[ Line: 15 ]] --[[ Name: MainView ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy), v1 (copy), v7 (copy), l_createElement_0 (copy), l_Pane_0 (copy), v4 (copy)
    local v10 = v5();
    local v11 = v6(v10);
    local v12 = v3.useContext(v1.Context);
    local v13 = v12.activeViewIdentifier and v11[v12.activeViewIdentifier];
    local v14 = v7();
    return l_createElement_0(l_Pane_0, {
        BackgroundTransparency = 1
    }, {
        StyleLink = v3.createElement("StyleLink", {
            StyleSheet = v14
        }), 
        SessionView = v13 and l_createElement_0(v4, {
            session = v13
        })
    });
end;