local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactRoblox);
local v5 = require(l_script_FirstAncestor_0.Components.ToolbarBase);
local _ = require(l_script_FirstAncestor_0.Types);
local v7 = require(l_script_FirstAncestor_0.Util.getToolbarDirection);
local v8 = require(l_script_FirstAncestor_0.Hooks.useStyleSheet);
local l_ContextServices_0 = v2.ContextServices;
return function(v10) --[[ Line: 17 ]] --[[ Name: Toolbar ]]
    -- upvalues: v8 (copy), v3 (copy), v4 (copy), l_ContextServices_0 (copy), v7 (copy), v5 (copy), l_CoreGui_0 (copy)
    local v11 = v8();
    local v12, v13 = v3.useState(nil);
    local v14 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v14 (copy), v13 (copy)
        assert(v14.current ~= nil, "ScreenGui was not mounted by useEffect");
        v13(v14.current);
    end, {});
    return v4.createPortal(v3.createElement("ScreenGui", {
        Archivable = false, 
        DisplayOrder = v10.DisplayOrder, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ref = v14
    }, {
        Focus = if v12 then l_ContextServices_0.provide({
            l_ContextServices_0.Focus.new(v12)
        }, {
            Toolbar = v3.createElement("Frame", {
                [v3.Tag] = ("VPF-Toolbar VPF-Toolbar--%* VPF-Toolbar--%*"):format(v7(v10), v10.InitialPosition or "Center")
            }, {
                ToolbarBase = v3.createElement(v5, v10)
            }), 
            StyleLink = v3.createElement("StyleLink", {
                StyleSheet = v11
            })
        }) else nil
    }), l_CoreGui_0);
end;