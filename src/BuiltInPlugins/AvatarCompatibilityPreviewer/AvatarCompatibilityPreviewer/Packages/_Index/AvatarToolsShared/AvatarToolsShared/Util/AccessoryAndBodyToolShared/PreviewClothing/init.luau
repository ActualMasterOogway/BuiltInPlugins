local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.AccessoryUtil);
local _ = require(l_Parent_0.getModelFromBackend);
local v4 = require(l_Parent_0.WrapUtil);
local v5 = require(l_Parent_0.ItemCharacteristics);
local v6 = require(l_Parent_1.Flags.GetFFlagAFTSelectHandleOnly);
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9, v10) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    if not v8 then
        return nil;
    else
        local v11 = setmetatable({}, v7);
        v11.model = v8;
        v11.autoscale = v9 == nil or v9;
        v11.model.Archivable = true;
        if v11.model:IsA("BasePart") then
            v11.model.Anchored = false;
        end;
        for _, v13 in ipairs(v11.model:GetDescendants()) do
            if v13:IsA("BasePart") then
                v13.Anchored = false;
            end;
        end;
        v11.id = v10;
        return v11;
    end;
end;
v7.transform = function(v14, v15, v16, v17, v18, v19) --[[ Line: 41 ]] --[[ Name: transform ]]
    -- upvalues: v2 (copy), v6 (copy), v5 (copy)
    local v20 = v2:getHandle(v14.model);
    local v21 = nil;
    if v6() then
        v21 = v20.Archivable;
        v20.Archivable = false;
    end;
    local l_Weld_0 = v20:FindFirstChildWhichIsA("Weld");
    if l_Weld_0 then
        l_Weld_0:Destroy();
    end;
    v20.Size = v15;
    if v5.isLegacyAccessory(v20) and v19 then
        v2:setSpecialMeshScale(v20, v19);
    end;
    v2:createOrReuseAttachmentInstance(v20, v20.Parent, v18, v16, v17);
    v2:attachClothingItem(v20.Parent, v20, v18, v14.autoscale);
    if v6() then
        v20.Archivable = v21;
    end;
end;
v7.deform = function(v23, v24, v25) --[[ Line: 74 ]] --[[ Name: deform ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v26 = v2:getHandle(v23.model);
    v4:deformClothing(v26, v24, v25);
end;
v7.destroy = function(v27) --[[ Line: 79 ]] --[[ Name: destroy ]]
    v27.model:Destroy();
    v27.model = nil;
end;
return v7;