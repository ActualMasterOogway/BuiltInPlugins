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
local v9 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddUsernameToRibbonAvatars)();
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local function _(v11, v12) --[[ Line: 9 ]] --[[ Name: getRbxthumbUrl ]]
    return (("rbxthumb://type=AvatarHeadShot&id=%*&w=%*&h=%*&filters=circular"):format(v11, v12.X, v12.Y));
end;
return function(v14) --[[ Line: 20 ]] --[[ Name: CollaboratorThumbnail ]]
    -- upvalues: v8 (copy), l_joinTags_0 (copy), v9 (copy)
    local l_createElement_0 = v8.createElement;
    local v16 = "Frame";
    local v17 = {
        [v8.Tag] = l_joinTags_0("Component-CollaboratorThumbnail Role-Surface", v14[v8.Tag])
    };
    local v18 = {
        ActivityRing = if not v14.IsIdle then v8.createElement("Frame", {
            [v8.Tag] = "Role-Surface X-Fit"
        }, {
            RingColor = v8.createElement("UIStroke", {
                Color = v14.RingColor
            })
        }) else nil
    };
    local v19;
    if v9 then
        v19 = v8.createElement;
        local v20 = "ImageLabel";
        local v21 = {
            key = v14.Username or "Avatar"
        };
        local l_UserId_0 = v14.UserId;
        local v23 = Vector2.new(60, 60);
        v21.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=%*&h=%*&filters=circular"):format(l_UserId_0, v23.X, v23.Y);
        v21[v8.Tag] = v14.IsIdle and "Idle" or nil;
        v19 = v19(v20, v21);
    else
        v19 = nil;
    end;
    v6(v18, 1, v19);
    local v24;
    if not v9 then
        v24 = v8.createElement;
        local v25 = "ImageLabel";
        local v26 = {};
        local l_UserId_1 = v14.UserId;
        local v28 = Vector2.new(60, 60);
        v26.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=%*&h=%*&filters=circular"):format(l_UserId_1, v28.X, v28.Y);
        v26[v8.Tag] = v14.IsIdle and "Idle" or nil;
        v24 = v24(v25, v26);
    else
        v24 = nil;
    end;
    v18.Avatar = v24;
    return l_createElement_0(v16, v17, v18);
end;