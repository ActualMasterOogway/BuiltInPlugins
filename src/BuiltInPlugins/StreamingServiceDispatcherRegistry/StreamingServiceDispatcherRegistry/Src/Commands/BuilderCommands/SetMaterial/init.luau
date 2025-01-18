local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local function _(v4, v5) --[[ Line: 8 ]] --[[ Name: applyToInstance ]]
    if v4:IsA("BasePart") then
        v4.Material = v5.BaseMaterial;
        v4.MaterialVariant = v5.Name;
    end;
end;
local function v14(v7, v8) --[[ Line: 15 ]] --[[ Name: doApplication ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v9 = v3.get(v8.applicationTargetInstanceId, v7.requestId);
    if not v9 then
        error((("Failed to find target for id %*"):format(v8.applicationTargetInstanceId)));
    end;
    assert(v9, "Luau");
    local v10 = v3.get(v8.materialId, v7.requestId);
    if not v10 then
        error((("Failed to find material for id %*"):format(v8.materialId)));
    end;
    assert(v10, "Luau");
    if not v10:IsA("MaterialVariant") then
        error((("Bad materialVariant instance from id %*, expected class of MaterialVariant, got %*"):format(v8.materialId, v10.ClassName)));
    end;
    assert(v10:IsA("MaterialVariant"), "Luau");
    if v9:IsA("BasePart") then
        v9.Material = v10.BaseMaterial;
        v9.MaterialVariant = v10.Name;
    end;
    for _, v12 in v9:GetDescendants() do
        if v12:IsA("BasePart") then
            v12.Material = v10.BaseMaterial;
            v12.MaterialVariant = v10.Name;
        end;
    end;
    local v13 = ("Applied %* to"):format(v10.Name);
    v1.modifyChatWithInstanceLink(v7.requestId, v9, v13, "set_material_" .. v7.requestId);
end;
return function(v15) --[[ Line: 44 ]] --[[ Name: setMaterial ]]
    -- upvalues: v3 (copy), v14 (copy)
    local l_arguments_0 = v15.arguments;
    assert(type(l_arguments_0.applicationTargetInstanceId) == "string", "Bad request.applicationTargetInstanceId");
    assert(type(l_arguments_0.materialId) == "string", "Bad request.materialId");
    v3.StartRecordingActions(v15.requestId);
    v14(v15, l_arguments_0);
    v3.EndRecordingActions(v15.requestId);
end;