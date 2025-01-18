local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Util.IconHelper);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.TooltipSettings);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useTooltip);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useWidgets);
return function(v11) --[[ Line: 38 ]] --[[ Name: SplitButton ]]
    -- upvalues: l_useState_0 (copy), v9 (copy), l_useRef_0 (copy), v10 (copy), l_useEffect_0 (copy), v1 (copy), v8 (copy), l_joinTags_0 (copy), v6 (copy)
    local v12, v13 = l_useState_0(false);
    local v14, v15 = l_useState_0(false);
    local v16, v17 = v9({
        Uri = v11.Uri, 
        Title = v11.Text, 
        Text = v11.Tooltip, 
        Shortcuts = v11.Shortcuts
    });
    local v18 = l_useRef_0(nil);
    local v19 = l_useRef_0(false);
    local v20 = v10();
    local v21 = l_useRef_0(nil);
    l_useEffect_0(function() --[[ Line: 54 ]]
        -- upvalues: v21 (copy), v11 (copy), v20 (copy)
        local l_current_0 = v21.current;
        if not l_current_0 then
            return;
        elseif v11.Uri then
            v20:register(v11.Uri, l_current_0);
            return function() --[[ Line: 61 ]]
                -- upvalues: v20 (ref), v11 (ref)
                v20:deregister(v11.Uri);
            end;
        else
            return nil;
        end;
    end, {
        v11.Uri
    });
    local v23 = nil;
    v23 = v11.Size == "Small" and "Small" or "Large";
    local v24 = v11.Size == "Small";
    return v1.createElement("TextButton", {
        LayoutOrder = v11.LayoutOrder, 
        ref = v21, 
        [v1.Event.InputBegan] = function(_, v26) --[[ Line: 76 ]]
            -- upvalues: v11 (copy), v8 (ref), v18 (copy), v19 (copy), v17 (copy)
            if not v11.Disabled and v26.UserInputType == Enum.UserInputType.MouseButton1 then
                v8.cancelShowTooltip();
                v18.current = false;
                local v27 = coroutine.create(function() --[[ Line: 80 ]]
                    -- upvalues: v19 (ref), v17 (ref), v11 (ref)
                    wait(0.4);
                    v19.current = true;
                    v17();
                    v11.OnSelectArrow(v11.Uri);
                end);
                coroutine.resume(v27);
                v18.current = v27;
            end;
        end, 
        [v1.Event.InputEnded] = function(_, v29) --[[ Line: 90 ]]
            -- upvalues: v11 (copy), v19 (copy), v18 (copy)
            if not v11.Disabled and v29.UserInputType == Enum.UserInputType.MouseButton1 then
                if not v19.current then
                    if v18.current and coroutine.status(v18.current) ~= "dead" then
                        coroutine.close(v18.current);
                        v18.current = nil;
                    end;
                    v11.OnSelect(v11.Uri);
                    return;
                else
                    v19.current = false;
                end;
            end;
        end, 
        [v1.Event.MouseEnter] = v16, 
        [v1.Event.MouseLeave] = function() --[[ Line: 104 ]]
            -- upvalues: v17 (copy), v19 (copy)
            v17();
            v19.current = false;
        end, 
        [v1.Tag] = l_joinTags_0("Component-RibbonButton X-Fit X-Column X-Center", v11.Disabled and "State-Disabled" or v11.Selected and "State-Selected" or "State-Default")
    }, {
        StateLayer = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("Role-Surface X-Fit", v14 and "State-Gradient-Pressed" or v12 and "State-Gradient-Hover" or nil, v24 and "X-CornerXS" or "X-CornerM")
        }, {
            RibbonTool = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("Role-Surface X-Fit X-Middle", v24 and "X-RowSplitButtonSmall X-PadSplitButtonToolSmall X-CornerXS" or "X-PadSplitButtonTool X-RowSplitButton X-CornerM")
            }, {
                RibbonToolButtonIcon = v1.createElement("ImageLabel", {
                    Image = v6.getPathForIcon(v11.Icon, v23), 
                    [v1.Tag] = v24 and "Icon-Small" or "Icon-Large"
                }), 
                DropdownArrow = v1.createElement("Frame", {
                    [v1.Tag] = l_joinTags_0("Component-SplitButtonDropdown Role-Surface X-Fit X-Row X-Bottom", v24 and "Small" or nil)
                }, {
                    DropdownArrowButton = v1.createElement("TextButton", {
                        [v1.Event.InputBegan] = function(_, v31) --[[ Line: 139 ]]
                            -- upvalues: v8 (ref), v15 (copy), v11 (copy)
                            if v31.UserInputType == Enum.UserInputType.MouseButton1 then
                                v8.cancelShowTooltip();
                                v15(true);
                                v11.OnSelectArrow(v11.Uri);
                            end;
                        end, 
                        [v1.Event.InputEnded] = function(_, v33) --[[ Line: 149 ]]
                            -- upvalues: v15 (copy)
                            if v33.UserInputType == Enum.UserInputType.MouseButton1 then
                                v15(false);
                            end;
                        end, 
                        [v1.Event.MouseEnter] = function() --[[ Line: 157 ]]
                            -- upvalues: v13 (copy)
                            v13(true);
                        end, 
                        [v1.Event.MouseLeave] = function() --[[ Line: 161 ]]
                            -- upvalues: v13 (copy)
                            v13(false);
                        end, 
                        [v1.Tag] = l_joinTags_0("Role-Surface X-Fit", v24 and "X-PadSplitButtonDropdownSmall" or "X-PadSplitButtonDropdown")
                    }, {
                        DropdownArrowIcon = v1.createElement("ImageLabel", {
                            [v1.Tag] = l_joinTags_0("Role-Surface", v24 and "Small" or nil)
                        })
                    })
                })
            })
        }), 
        Text = if not v11.IconOnly then v1.createElement("TextLabel", {
            Text = v11.Text, 
            [v1.Tag] = "X-Fit X-PadButtonLabel"
        }) else nil
    });
end;