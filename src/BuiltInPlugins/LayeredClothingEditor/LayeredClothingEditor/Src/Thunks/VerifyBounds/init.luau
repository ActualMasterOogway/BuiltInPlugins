local l_Parent_0 = script.Parent.Parent.Parent;
local l_AccessoryAndBodyToolShared_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local v4 = require(l_Parent_0.Src.Actions.SetInBounds);
return function(v5, v6) --[[ Line: 15 ]]
    -- upvalues: l_ItemCharacteristics_0 (copy), v4 (copy), l_AccessoryUtil_0 (copy)
    return function(v7) --[[ Line: 16 ]]
        -- upvalues: v5 (copy), l_ItemCharacteristics_0 (ref), v4 (ref), v6 (ref), l_AccessoryUtil_0 (ref)
        if not v5 then
            return;
        elseif l_ItemCharacteristics_0.isAvatar(v5) then
            v7:dispatch(v4(true));
            return;
        else
            local l_accessoryTypeInfo_0 = v7:getState().selectItem.accessoryTypeInfo;
            if not l_accessoryTypeInfo_0 then
                return;
            else
                if not v6 then
                    v6 = v5:FindFirstChild(l_accessoryTypeInfo_0.Name);
                    if not v6 then
                        return nil;
                    end;
                end;
                local l_Bounds_0 = l_accessoryTypeInfo_0.Bounds;
                local l_Offset_0 = l_accessoryTypeInfo_0.Offset;
                local v11 = l_AccessoryUtil_0:checkAccessoryBounds(v6.WorldPosition + l_Offset_0, l_Bounds_0, v5.CFrame, v5.Size);
                v7:dispatch(v4(v11));
                return;
            end;
        end;
    end;
end;