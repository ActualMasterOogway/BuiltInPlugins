local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local v4 = require(l_script_FirstAncestor_0.Src.Util.IconHelper);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.TooltipSettings);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useTooltip);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useWidgets);
return function(v10) --[[ Line: 36 ]] --[[ Name: RibbonButton ]]
    -- upvalues: l_useRef_0 (copy), v9 (copy), l_useEffect_0 (copy), v4 (copy), v8 (copy), v1 (copy), v7 (copy), l_joinTags_0 (copy)
    local v11 = l_useRef_0(nil);
    v11 = v10.ForwardRef or v11;
    local v12 = v9();
    l_useEffect_0(function() --[[ Line: 40 ]]
        -- upvalues: v11 (ref), v10 (copy), v12 (copy)
        local l_current_0 = v11.current;
        if not l_current_0 then
            return;
        elseif v10.Uri then
            v12:register(v10.Uri, l_current_0);
            return function() --[[ Line: 47 ]]
                -- upvalues: v12 (ref), v10 (ref)
                v12:deregister(v10.Uri);
            end;
        else
            return nil;
        end;
    end, {
        v10.Uri
    });
    local v14 = nil;
    v14 = v10.Size == "Small" and "Small" or "Large";
    local v15 = v10.Size == "Small";
    local v16 = if v10.Icon then v10.Icon:find("/") else nil;
    local v17 = if v10.Icon then if v16 then v10.Icon else v4.getPathForIcon(v10.Icon, v14) else nil;
    local v18, v19 = v8({
        Uri = v10.Uri, 
        Title = v10.Text, 
        Text = v10.Tooltip, 
        Shortcuts = v10.Shortcuts
    });
    return v1.createElement("TextButton", {
        ref = v11, 
        LayoutOrder = v10.LayoutOrder, 
        [v1.Event.InputBegan] = function(_, v21) --[[ Line: 75 ]]
            -- upvalues: v10 (copy), v7 (ref)
            if not v10.Disabled and v21.UserInputType == Enum.UserInputType.MouseButton1 then
                v7.cancelShowTooltip();
                v10.OnSelect(v10.Uri);
            end;
        end, 
        Visible = v10.Visible, 
        [v1.Event.MouseEnter] = v18, 
        [v1.Event.MouseLeave] = v19, 
        [v1.Tag] = l_joinTags_0("Component-RibbonButton X-Fit X-Column X-Center", v10.Disabled and "State-Disabled" or v10.Selected and "State-Selected" or "State-Default", v10[v1.Tag])
    }, {
        RibbonTool = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("Role-Surface X-Fit", v15 and "X-PadMezzanine X-CornerXS" or "X-PadRibbonTool X-CornerM")
        }, {
            RibbonToolButtonIcon = v1.createElement("ImageLabel", {
                Image = v17, 
                [v1.Tag] = v15 and "Icon-Small" or "Icon-Large"
            })
        }), 
        Text = if not v10.IconOnly then v1.createElement("TextLabel", {
            Text = v10.Text, 
            [v1.Tag] = "X-Fit X-PadButtonLabel"
        }) else nil
    });
end;