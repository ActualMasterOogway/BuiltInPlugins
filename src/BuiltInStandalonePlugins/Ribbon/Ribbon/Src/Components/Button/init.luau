local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local v4 = require(l_script_FirstAncestor_0.Src.Util.IconHelper);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_joinTags_0 = v5.Styling.joinTags;
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.TooltipSettings);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useTooltip);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useWidgets);
return function(v11) --[[ Line: 37 ]] --[[ Name: Button ]]
    -- upvalues: l_useRef_0 (copy), v10 (copy), l_useEffect_0 (copy), v4 (copy), v9 (copy), v1 (copy), v8 (copy), l_joinTags_0 (copy)
    local v12 = l_useRef_0(nil);
    v12 = v11.ForwardRef or v12;
    local v13 = v10();
    l_useEffect_0(function() --[[ Line: 41 ]]
        -- upvalues: v12 (ref), v11 (copy), v13 (copy)
        local l_current_0 = v12.current;
        if not l_current_0 then
            return;
        elseif v11.Uri then
            v13:register(v11.Uri, l_current_0);
            return function() --[[ Line: 48 ]]
                -- upvalues: v13 (ref), v11 (ref)
                v13:deregister(v11.Uri);
            end;
        else
            return nil;
        end;
    end, {
        v11.Uri
    });
    local v15 = v11.Size == "Small" and "Small" or "Large";
    local v16 = if not v11.TextOnly then v11.IconSide or "Left" else nil;
    local v17 = if v11.Icon then v11.Icon:find("/") else nil;
    local v18 = if v11.Icon then if v17 then v11.Icon else v4.getPathForIcon(v11.Icon, v15) else nil;
    local v19, v20 = v9({
        Uri = v11.Uri, 
        Title = v11.TooltipTitle, 
        Text = v11.Tooltip, 
        Shortcuts = v11.Shortcuts
    });
    return v1.createElement("TextButton", {
        ref = v12, 
        LayoutOrder = v11.LayoutOrder, 
        [v1.Event.InputBegan] = function(_, v22) --[[ Line: 75 ]]
            -- upvalues: v11 (copy), v8 (ref)
            if not v11.Disabled and v22.UserInputType == Enum.UserInputType.MouseButton1 then
                v8.cancelShowTooltip();
                v11.OnSelect(v11.Uri);
            end;
        end, 
        Visible = v11.Visible, 
        [v1.Event.MouseEnter] = v19, 
        [v1.Event.MouseLeave] = v20, 
        [v1.Tag] = l_joinTags_0("Component-Button Role-Surface X-Fit X-CornerM", v11.Disabled and "State-Disabled" or "State-Default", v11[v1.Tag])
    }, {
        StateLayer = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("Role-Surface X-Fit X-CornerM", v11.Size == "Small" and "X-PadButtonSmall" or v11.Size == "Large" and "X-PadButtonLarge" or "X-PadButtonMedium", "X-Row X-Middle X-Center")
        }, {
            ButtonIcon = if not v11.TextOnly then v1.createElement("ImageLabel", {
                Image = v18, 
                [v1.Tag] = l_joinTags_0(v15 == "Small" and "Icon-Small" or "Icon-Large", v16, "Role-Surface")
            }) else nil, 
            ButtonText = v1.createElement("TextLabel", {
                Text = v11.Text, 
                [v1.Tag] = l_joinTags_0("Role-Surface X-Fit", v11.Size == "Small" and "Small" or v11.Size == "Large" and "Large" or nil)
            })
        })
    });
end;