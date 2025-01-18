local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Enums.NotificationTargetType);
local v2 = require(l_Parent_0.Src.Resources.NotificationLuaIcons);
local v3 = {};
for _, v5 in ipairs(v2) do
    v3[v5] = ("Plugin-Icon-%*"):format(v5);
end;
local v8 = {
    [v1.Universe] = function(v6) --[[ Line: 16 ]]
        return (("rbxthumb://type=GameIcon&id=%*&w=50&h=50"):format(v6));
    end, 
    [v1.User] = function(v7) --[[ Line: 19 ]]
        return (("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format(v7));
    end
};
return {
    getDynamicIconPath = function(v9, v10) --[[ Line: 24 ]] --[[ Name: getDynamicIconPath ]]
        -- upvalues: v8 (copy)
        if v8[v10] then
            return v8[v10](v9);
        else
            return nil;
        end;
    end, 
    getReadStatusIconTag = function(v11, v12) --[[ Line: 32 ]] --[[ Name: getReadStatusIconTag ]]
        if v12 then
            return "Plugin-Icon-StatusDisabled";
        elseif v11 then
            return "";
        else
            return "Plugin-Icon-StatusUnread";
        end;
    end, 
    getStaticIconTag = function(v13, v14) --[[ Line: 44 ]] --[[ Name: getStaticIconTag ]]
        -- upvalues: v1 (copy), v3 (copy)
        if v14 ~= v1.Static then
            return nil;
        elseif v3[v13] then
            return v3[v13];
        else
            return "Plugin-Icon-NotificationBell";
        end;
    end
};