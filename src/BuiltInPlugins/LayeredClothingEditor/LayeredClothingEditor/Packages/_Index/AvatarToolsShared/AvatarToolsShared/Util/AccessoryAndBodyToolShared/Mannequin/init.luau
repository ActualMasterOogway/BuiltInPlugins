local l_InsertService_0 = game:GetService("InsertService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = script.Parent;
local v4 = require(l_Parent_1.Constants);
local v5 = require(l_Parent_1.PreviewAvatar);
local v6 = require(l_Parent_1.PreviewUtil);
local v7 = require(l_Parent_1.WrapUtil);
local v8 = require(l_Parent_1.ItemCharacteristics);
local v9 = require(l_Parent_0.Flags.GetFFlagAFTSelectHandleOnly);
local v10 = setmetatable({}, {
    __index = v5
});
v10.__index = v10;
local function _(v11) --[[ Line: 23 ]] --[[ Name: terminateConnections ]]
    if v11.AncestryChangedHandle then
        v11.AncestryChangedHandle:Disconnect();
        v11.AncestryChangedHandle = nil;
    end;
end;
local function v16(v13) --[[ Line: 30 ]] --[[ Name: removeWraps ]]
    for _, v15 in v13.model:GetDescendants() do
        if v15:IsA("BaseWrap") then
            v15:Destroy();
        end;
    end;
end;
local function v18(v17) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v9 (copy), v8 (copy), v16 (copy), v6 (copy)
    if v17.sourceDisplayItem then
        v17.displayItem = v17.sourceDisplayItem:Clone();
        v17.displayItem.Name = l_HttpService_0:GenerateGUID();
        if v9() and not v8.hasAnyCage(v17.displayItem) then
            v17.displayItem.CanCollide = false;
            v16(v17);
        end;
        v6.addPreviewClothingFromInstance(v17, v17.displayItem, false);
        v17.AncestryChangedHandle = v17.displayItem.AncestryChanged:Connect(function() --[[ Line: 47 ]]
            -- upvalues: v17 (copy)
            v17:reset();
        end);
        return;
    else
        v17.AncestryChangedHandle = v17.model.AncestryChanged:Connect(function() --[[ Line: 51 ]]
            -- upvalues: v17 (copy)
            v17:reset();
        end);
        return;
    end;
end;
v10.reset = function(v19) --[[ Line: 57 ]] --[[ Name: reset ]]
    -- upvalues: v5 (copy), v18 (copy)
    if v19.AncestryChangedHandle then
        v19.AncestryChangedHandle:Disconnect();
        v19.AncestryChangedHandle = nil;
    end;
    v5.destroy(v19);
    v19.model = v19.sourceMannequin:Clone();
    v19.model.Archivable = false;
    v19.model.Parent = v19.sourceParent;
    v18(v19);
    v19.onMannequinReset();
end;
v10.new = function(v20, v21, v22, v23) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: l_InsertService_0 (copy), v4 (copy), v7 (copy), v5 (copy), l_HttpService_0 (copy), v10 (copy), v18 (copy)
    if not v21 then
        v21 = l_InsertService_0:LoadLocalAsset(v4.MANNEQUIN_PATH);
    end;
    local v24 = v21:Clone();
    v7:makeDeformerNamesUnique(v24);
    local v25 = setmetatable(v5.new(v24:Clone(), v22, l_HttpService_0:GenerateGUID()), v10);
    v25.sourceMannequin = v24;
    v25.sourceDisplayItem = v20:Clone();
    v7:makeDeformerNamesUnique(v25.sourceDisplayItem);
    v25.sourceParent = v22;
    v25.onMannequinReset = v23;
    v18(v25);
    v7:initTempCageData(v25.sourceDisplayItem);
    return v25;
end;
v10.destroy = function(v26) --[[ Line: 92 ]] --[[ Name: destroy ]]
    -- upvalues: v5 (copy)
    if v26.AncestryChangedHandle then
        v26.AncestryChangedHandle:Disconnect();
        v26.AncestryChangedHandle = nil;
    end;
    v26.sourceMannequin = nil;
    if v26.sourceDisplayItem then
        v26.sourceDisplayItem:Destroy();
        v26.sourceDisplayItem = nil;
    end;
    if v26.displayItem then
        v26.displayItem:Destroy();
        v26.displayItem = nil;
    end;
    v5.destroy(v26);
end;
return v10;