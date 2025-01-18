local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v6.Styling.joinTags;
local l_DoubleClickDetector_0 = v6.Util.DoubleClickDetector;
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useWidgets);
return function(v10) --[[ Line: 28 ]] --[[ Name: Tab ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), l_DoubleClickDetector_0 (copy), v9 (copy), l_useEffect_0 (copy), v1 (copy), l_joinTags_0 (copy)
    local v11 = l_useRef_0(nil);
    local v12 = l_useState_0(l_DoubleClickDetector_0.new());
    v11 = v10.ForwardRef or v11;
    local v13 = v9();
    l_useEffect_0(function() --[[ Line: 34 ]]
        -- upvalues: v11 (ref), v10 (copy), v13 (copy)
        local l_current_0 = v11.current;
        if not l_current_0 then
            return;
        elseif v10.Uri then
            v13:register(v10.Uri, l_current_0);
            return function() --[[ Line: 41 ]]
                -- upvalues: v13 (ref), v10 (ref)
                v13:deregister(v10.Uri);
            end;
        else
            return nil;
        end;
    end, {
        v10.Uri
    });
    return v1.createElement("TextButton", {
        ref = v11, 
        LayoutOrder = v10.LayoutOrder, 
        Text = v10.Text, 
        [v1.Event.Activated] = function() --[[ Line: 53 ]]
            -- upvalues: v10 (copy), v12 (copy)
            v10.OnTabSelected(v10.Uri, v12:isDoubleClick());
        end, 
        [v1.Tag] = l_joinTags_0("Component-RibbonTab X-CornerM X-Fit X-PadTab", v10.Enabled == false and "State-Disabled" or v10.Selected and "State-Selected" or "State-Default")
    });
end;