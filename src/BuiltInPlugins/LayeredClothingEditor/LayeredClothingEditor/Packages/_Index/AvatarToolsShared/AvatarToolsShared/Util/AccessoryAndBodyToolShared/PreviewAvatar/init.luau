local l_Parent_0 = script.Parent;
local _ = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.AccessoryUtil);
local _ = require(l_Parent_0.AvatarUtil);
local _ = require(l_Parent_0.getModelFromBackend);
local v5 = require(l_Parent_0.ItemCharacteristics);
local v6 = require(l_Parent_0.WrapUtil);
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9, v10) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    if not v8 then
        return nil;
    else
        local v11 = setmetatable({}, v7);
        v11.model = v8;
        v11.model.Archivable = true;
        v11.model.Parent = v9;
        v11.clothing = {};
        v11.id = v10;
        return v11;
    end;
end;
v7.transformLayer = function(v12, v13, v14, v15, v16, v17, v18) --[[ Line: 33 ]] --[[ Name: transformLayer ]]
    local v19 = v12.clothing[v13];
    if v19 then
        v19:transform(v14, v15, v16, v17, v18);
    end;
end;
v7.deformLayer = function(v20, v21, v22, v23) --[[ Line: 47 ]] --[[ Name: deformLayer ]]
    local v24 = v20.clothing[v21];
    if v24 then
        v24:deform(v22, v23);
    end;
end;
v7.deformAvatarBody = function(v25, v26, v27) --[[ Line: 54 ]] --[[ Name: deformAvatarBody ]]
    -- upvalues: v6 (copy)
    v6:deformBody(v25.model, v26, v27);
end;
v7.addLayer = function(v28, v29) --[[ Line: 58 ]] --[[ Name: addLayer ]]
    -- upvalues: v2 (copy), v5 (copy)
    if not v29 then
        return;
    else
        v2:attachClothingItem(v28.model, v29.model);
        table.insert(v28.clothing, v29);
        local v30 = v2:getHandle(v29.model);
        if not v5.hasAnyCage(v30) then
            local l_Attachment_0 = v30:FindFirstChildOfClass("Attachment");
            if not l_Attachment_0 then
                return #v28.clothing;
            else
                local v32 = v2:getExistingAttachmentPoint(v30, v28.model, l_Attachment_0.Name);
                if not v32 then
                    return #v28.clothing;
                else
                    local v33 = nil;
                    if v5.isLegacyAccessory(v30) then
                        v33 = v2:getSpecialMeshScale(v30);
                    end;
                    v29:transform(v30.Size, v32.AttachmentCFrame, v32.ItemCFrame, l_Attachment_0.Name, v33);
                end;
            end;
        end;
        return #v28.clothing;
    end;
end;
v7.setLayer = function(v34, v35, v36) --[[ Line: 94 ]] --[[ Name: setLayer ]]
    -- upvalues: v2 (copy)
    v2:attachClothingItem(v34.model, v36.model);
    v34:removeClothing(v35);
    v34.clothing[v35] = v36;
end;
v7.removeLayer = function(v37, v38) --[[ Line: 100 ]] --[[ Name: removeLayer ]]
    if v37.clothing[v38] then
        v37.clothing[v38]:destory();
        v37.clothing[v38] = nil;
    end;
end;
v7.removeAllClothing = function(v39) --[[ Line: 107 ]] --[[ Name: removeAllClothing ]]
    for _, v41 in ipairs(v39.clothing) do
        v41:destroy();
    end;
    v39.clothing = {};
end;
v7.destroy = function(v42) --[[ Line: 114 ]] --[[ Name: destroy ]]
    v42:removeAllClothing();
    if v42.model then
        v42.model:Destroy();
    end;
    v42.model = nil;
end;
return v7;