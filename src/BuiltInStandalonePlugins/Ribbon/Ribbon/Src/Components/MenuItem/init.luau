local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioActionsRespectNilIcon);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Util.IconHelper);
local v7 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local v8 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_join_0 = v8.join;
local l_map_0 = v8.map;
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useMenu);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useWidgets);
local function _(v14) --[[ Line: 48 ]] --[[ Name: getCurrentState ]]
    if v14.Disabled then
        if v14.Children then
            return "State-ActionDisabled";
        else
            return "State-Disabled";
        end;
    elseif v14.Selected then
        return "State-Selected";
    else
        return "State-Default";
    end;
end;
return function(v16) --[[ Line: 62 ]] --[[ Name: MenuItem ]]
    -- upvalues: v6 (copy), v12 (copy), l_useRef_0 (copy), v7 (copy), v13 (copy), l_useEffect_0 (copy), l_map_0 (copy), l_join_0 (copy), v2 (copy), l_joinTags_0 (copy), v1 (copy)
    local v17 = if v16.Icon then v16.Icon:find("/") else nil;
    local v18 = if v16.Icon then if v17 then v16.Icon else v6.getPathForIcon(v16.Icon, if v16.Size == "Small" then v16.Size else "Large") else nil;
    local v19, v20, v21 = v12(v16.MenuView);
    local v22 = l_useRef_0(nil);
    local v23 = if v16.WidgetUri and v16.Id then v7.child(v16.WidgetUri, v16.Id) else nil;
    local v24 = v13();
    l_useEffect_0(function() --[[ Line: 74 ]]
        -- upvalues: v22 (copy), v23 (copy), v24 (copy)
        local l_current_0 = v22.current;
        if not l_current_0 then
            return;
        elseif v23 then
            v24:register(v23, l_current_0);
            return function() --[[ Line: 81 ]]
                -- upvalues: v24 (ref), v23 (ref)
                v24:deregister(v23);
            end;
        else
            return;
        end;
    end, {
        v23
    });
    local v26 = v16.Size == "Large" and 10 or 8;
    local v27 = if v21.menuOnLeft then Vector2.new(-v26, 0) else Vector2.new(v26, 0);
    local function v31() --[[ Line: 93 ]] --[[ Name: onMouseEnter ]]
        -- upvalues: l_map_0 (ref), v16 (copy), l_join_0 (ref), v19 (copy), v23 (copy), v21 (copy), v27 (copy)
        local v29 = l_map_0(v16.Children, function(v28) --[[ Line: 94 ]]
            -- upvalues: l_join_0 (ref)
            return l_join_0(v28, {
                Type = (not (v28.Type ~= "IconButton") or v28.Type == "SplitButton") and "Option" or v28.Type
            });
        end);
        local v30 = {
            Type = "Column", 
            Children = v29
        };
        v19({
            v30
        }, v23, {
            TargetAnchorPoint = if v21.menuOnLeft then Vector2.new(0, 0) else Vector2.new(1, 0), 
            SubjectAnchorPoint = if v21.menuOnLeft then Vector2.new(1, 0) else Vector2.new(0, 0), 
            Offset = v27
        });
    end;
    return v2.createElement("TextButton", {
        LayoutOrder = v16.LayoutOrder, 
        ref = v22, 
        [v2.Event.Activated] = function() --[[ Line: 121 ]]
            -- upvalues: v16 (copy), v23 (copy)
            if not v16.Disabled then
                v16.OnSelect(v23);
            end;
        end, 
        [v2.Event.MouseEnter] = if v16.Children then v31 else function() --[[ Line: 128 ]]
            -- upvalues: v20 (copy), v21 (copy)
            v20(v21.depth);
        end, 
        [v2.Tag] = l_joinTags_0("Component-MenuItem X-FitY X-CornerS X-PadMenuOption", if v16.Disabled then v16.Children and "State-ActionDisabled" or "State-Disabled" else v16.Selected and "State-Selected" or "State-Default", if v16.Size == "Small" then v16.Size else nil)
    }, {
        Row = v2.createElement("Frame", {
            [v2.Tag] = "Role-Surface X-RowSpace100 X-Middle X-Fit"
        }, {
            Image = if if v1 then v18 else v16.Icon then v2.createElement("ImageLabel", {
                Image = v18, 
                [v2.Tag] = "Icon"
            }) else nil, 
            Text = v2.createElement("TextLabel", {
                Text = v16.Text or "", 
                [v2.Tag] = "X-Fit"
            }), 
            ArrowSpace = if v16.Children then v2.createElement("Frame", {
                [v2.Tag] = "Role-Surface X-Fit X-ArrowSpace"
            }) else nil
        }), 
        Arrow = if v16.Children then v2.createElement("ImageLabel", {
            [v2.Tag] = "Arrow"
        }) else nil
    });
end;