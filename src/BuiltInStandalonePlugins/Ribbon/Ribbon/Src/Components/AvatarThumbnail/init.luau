local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v8 = require(l_script_FirstAncestor_0.Packages.React);
local l_useRef_0 = v8.useRef;
local l_useEffect_0 = v8.useEffect;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local v13 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddUsernameToRibbonAvatars)();
local v14 = require(l_script_FirstAncestor_0.Src.Hooks.TooltipSettings);
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.useTooltip);
local v16 = require(l_script_FirstAncestor_0.Src.Hooks.useWidgets);
local function _(v17, v18) --[[ Line: 33 ]] --[[ Name: getRbxthumbUrl ]]
    return (("rbxthumb://type=AvatarHeadShot&id=%*&w=%*&h=%*&filters=circular"):format(v17, v18.X, v18.Y));
end;
return function(v20) --[[ Line: 37 ]] --[[ Name: AvatarThumbnail ]]
    -- upvalues: l_useRef_0 (copy), v16 (copy), l_useEffect_0 (copy), v15 (copy), v8 (copy), v14 (copy), l_joinTags_0 (copy), v13 (copy)
    local v21 = l_useRef_0(nil);
    v21 = v20.ForwardRef or v21;
    local v22 = v16();
    l_useEffect_0(function() --[[ Line: 41 ]]
        -- upvalues: v21 (ref), v20 (copy), v22 (copy)
        local l_current_0 = v21.current;
        if not l_current_0 then
            return;
        elseif v20.Uri then
            v22:register(v20.Uri, l_current_0);
            return function() --[[ Line: 48 ]]
                -- upvalues: v22 (ref), v20 (ref)
                v22:deregister(v20.Uri);
            end;
        else
            return nil;
        end;
    end, {
        v20.Uri
    });
    local v24, v25 = v15({
        Uri = v20.Uri, 
        Title = v20.TooltipTitle, 
        Text = v20.Tooltip, 
        Shortcuts = v20.Shortcuts
    });
    local l_createElement_0 = v8.createElement;
    local v27 = "TextButton";
    local v30 = {
        ref = v21, 
        LayoutOrder = v20.LayoutOrder, 
        [v8.Event.InputBegan] = function(_, v29) --[[ Line: 65 ]]
            -- upvalues: v14 (ref), v20 (copy)
            if v29.UserInputType == Enum.UserInputType.MouseButton1 then
                v14.cancelShowTooltip();
                v20.OnSelect(v20.Uri);
            end;
        end, 
        Visible = v20.Visible, 
        [v8.Event.MouseEnter] = v24, 
        [v8.Event.MouseLeave] = v25, 
        [v8.Tag] = l_joinTags_0("Component-AvatarThumbnail Role-Surface X-Fit", v20[v8.Tag])
    };
    local v31 = {};
    local v32;
    if v13 then
        v32 = v8.createElement;
        local v33 = "ImageLabel";
        local v34 = {
            key = v20.TooltipTitle or "Avatar"
        };
        local l_UserId_0 = v20.UserId;
        local v36 = Vector2.new(60, 60);
        v34.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=%*&h=%*&filters=circular"):format(l_UserId_0, v36.X, v36.Y);
        v34[v8.Tag] = v20.Size;
        v32 = v32(v33, v34);
    else
        v32 = nil;
    end;
    v6(v31, 1, v32);
    local v37;
    if not v13 then
        v37 = v8.createElement;
        local v38 = "ImageLabel";
        local v39 = {};
        local l_UserId_1 = v20.UserId;
        local v41 = Vector2.new(60, 60);
        v39.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=%*&h=%*&filters=circular"):format(l_UserId_1, v41.X, v41.Y);
        v39[v8.Tag] = v20.Size;
        v37 = v37(v38, v39);
    else
        v37 = nil;
    end;
    v31.Avatar = v37;
    return l_createElement_0(v27, v30, v31);
end;