local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Src.Util.IconHelper);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.TooltipSettings);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useWidgets);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useTooltip);
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useMenu);
local l_joinTags_0 = v4.Styling.joinTags;
return function(v13) --[[ Line: 62 ]] --[[ Name: RibbonSelectInput ]]
    -- upvalues: l_useRef_0 (copy), v9 (copy), v7 (copy), l_useEffect_0 (copy), v5 (copy), v10 (copy), v1 (copy), v8 (copy), l_joinTags_0 (copy)
    local v14 = l_useRef_0(nil);
    local v15 = v9();
    v14 = v13.ForwardRef or v14;
    local v16 = v13.MenuData.isOpen and v13.MenuData.widgetUriString == v7.toString(v13.Uri);
    l_useEffect_0(function() --[[ Line: 69 ]]
        -- upvalues: v14 (ref), v13 (copy), v15 (copy)
        local l_current_0 = v14.current;
        if not l_current_0 then
            return;
        elseif v13.Uri then
            v15:register(v13.Uri, l_current_0);
            return function() --[[ Line: 76 ]]
                -- upvalues: v15 (ref), v13 (ref)
                v15:deregister(v13.Uri);
            end;
        else
            return nil;
        end;
    end, {
        v13.Uri
    });
    local v18 = v13.IconSide or "Left";
    local v19 = if v13.Icon then v13.Icon:find("/") else nil;
    local v20 = if v13.Icon then if v19 then v13.Icon else v5.getPathForIcon(v13.Icon, "Small") else nil;
    local v21, v22 = v10({
        Uri = v13.Uri, 
        Title = v13.TooltipTitle, 
        Text = v13.Tooltip, 
        Shortcuts = v13.Shortcuts
    });
    return v1.createElement("TextButton", {
        ref = v14, 
        LayoutOrder = v13.LayoutOrder, 
        [v1.Event.InputBegan] = function(_, v24) --[[ Line: 103 ]]
            -- upvalues: v13 (copy), v8 (ref)
            if not v13.Disabled and v24.UserInputType == Enum.UserInputType.MouseButton1 then
                v8.cancelShowTooltip();
                v13.OnSelect(v13.Uri);
            end;
        end, 
        Visible = v13.Visible, 
        [v1.Event.MouseEnter] = v21, 
        [v1.Event.MouseLeave] = v22, 
        [v1.Tag] = l_joinTags_0("Component-RibbonSelectInput Role-Surface X-CornerS X-Row X-Middle", v13.Disabled and "State-Disabled" or "State-Default", v16 and "State-Focus" or nil, v13[v1.Tag])
    }, {
        Value = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("Role-Surface X-Fill X-Row X-RowSpace50 X-Middle")
        }, {
            Icon = if v20 then v1.createElement("ImageLabel", {
                Image = v20, 
                [v1.Tag] = l_joinTags_0("Role-Surface", v18)
            }) else nil, 
            Text = v1.createElement("TextLabel", {
                Text = v13.Text, 
                [v1.Tag] = l_joinTags_0("Role-Surface X-Fill")
            })
        }), 
        DropdownIcon = v1.createElement("ImageLabel", {
            [v1.Tag] = l_joinTags_0("Role-Surface", v16 and "Icon-Up" or nil)
        })
    });
end;