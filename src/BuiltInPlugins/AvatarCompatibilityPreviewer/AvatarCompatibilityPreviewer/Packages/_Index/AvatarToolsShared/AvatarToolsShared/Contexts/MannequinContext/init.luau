local l_InsertService_0 = game:GetService("InsertService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextItem_0 = require(l_Parent_1.Framework).ContextServices.ContextItem;
local v4 = require(l_Parent_0.Util.AccessoryAndBodyToolShared.Constants);
local v5 = l_ContextItem_0:extend("MannequinContext");
local function _(v6) --[[ Line: 16 ]] --[[ Name: newInternal ]]
    -- upvalues: v5 (copy)
    local v7 = {};
    setmetatable(v7, v5);
    v7.mannequinPath = v6;
    return v7;
end;
v5.new = function() --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v5 (copy)
    local l_MANNEQUIN_PATH_0 = v4.MANNEQUIN_PATH;
    local v10 = {};
    setmetatable(v10, v5);
    v10.mannequinPath = l_MANNEQUIN_PATH_0;
    return v10;
end;
local v11 = {
    BodyFrontAttachment = "Torso"
};
v5.createMannequinForClothing = function(_, v13) --[[ Line: 31 ]] --[[ Name: createMannequinForClothing ]]
    -- upvalues: l_InsertService_0 (copy), v11 (copy)
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = "Mannequin";
    local l_BaseWrap_0 = v13:FindFirstChildWhichIsA("BaseWrap");
    local l_l_InsertService_0_MeshPartAsync_0 = l_InsertService_0:CreateMeshPartAsync(l_BaseWrap_0.ReferenceMeshId, Enum.CollisionFidelity.PreciseConvexDecomposition, Enum.RenderFidelity.Automatic);
    l_l_InsertService_0_MeshPartAsync_0.Parent = l_Model_0;
    l_l_InsertService_0_MeshPartAsync_0.Name = "Torso";
    l_Model_0.PrimaryPart = l_l_InsertService_0_MeshPartAsync_0;
    local l_WrapTarget_0 = Instance.new("WrapTarget");
    l_WrapTarget_0.Name = "WrapTarget";
    l_WrapTarget_0.CageMeshId = l_BaseWrap_0.ReferenceMeshId;
    l_WrapTarget_0.Parent = l_l_InsertService_0_MeshPartAsync_0;
    Instance.new("Humanoid").Parent = l_Model_0;
    for v18, v19 in v11 do
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Name = v18;
        l_Attachment_0.Parent = l_Model_0:FindFirstChild(v19);
    end;
    return l_Model_0;
end;
v5.mock = function() --[[ Line: 61 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v5 (copy)
    local l_MANNEQUIN_MOCK_PATH_0 = v4.MANNEQUIN_MOCK_PATH;
    local v22 = {};
    setmetatable(v22, v5);
    v22.mannequinPath = l_MANNEQUIN_MOCK_PATH_0;
    return v22;
end;
v5.createMannequinModel = function(v23) --[[ Line: 65 ]] --[[ Name: createMannequinModel ]]
    -- upvalues: l_InsertService_0 (copy)
    return l_InsertService_0:LoadLocalAsset(v23.mannequinPath);
end;
return v5;