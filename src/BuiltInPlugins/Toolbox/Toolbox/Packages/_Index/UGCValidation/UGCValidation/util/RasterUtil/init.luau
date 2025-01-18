local l_AssetService_0 = game:GetService("AssetService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.tryYield);
local v4 = {};
local function _(v5, v6, v7) --[[ Line: 30 ]] --[[ Name: orthoProjectCoordinate ]]
    local v8 = v5:Dot(v7);
    local v9 = v6:Dot(v7);
    return Vector2.new(v8, v9);
end;
local function _(v11, v12) --[[ Line: 37 ]] --[[ Name: shouldRenderTriangle ]]
    return math.deg((math.abs((math.acos((v11:Dot(v12))))))) < 90;
end;
local function v37(v14, v15, v16, v17, v18) --[[ Line: 45 ]] --[[ Name: getScreenCoordinatesForTriangle ]]
    local v19 = v14[1];
    local v20 = v14[2];
    local v21 = v14[3];
    local v22 = CFrame.new(v17):Inverse() * v19;
    local v23 = CFrame.new(v17):Inverse() * v20;
    local v24 = CFrame.new(v17):Inverse() * v21;
    local v25 = v18 / 2;
    local v26 = (v22 + v25) / v18;
    local v27 = (v23 + v25) / v18;
    local v28 = (v24 + v25) / v18;
    local l_axis1_0 = v16.axis1;
    local l_axis2_0 = v16.axis2;
    local v31 = l_axis1_0:Dot(v26);
    local v32 = l_axis2_0:Dot(v26);
    local v33 = Vector2.new(v31, v32) * (v15 - Vector2.new(1, 1));
    l_axis2_0 = v16.axis1;
    v31 = v16.axis2;
    v32 = l_axis2_0:Dot(v27);
    local v34 = v31:Dot(v27);
    local v35 = Vector2.new(v32, v34) * (v15 - Vector2.new(1, 1));
    v31 = v16.axis1;
    v32 = v16.axis2;
    v34 = v31:Dot(v28);
    local v36 = v32:Dot(v28);
    return v33, v35, Vector2.new(v34, v36) * (v15 - Vector2.new(1, 1));
end;
v4.rasterMesh = function(v38, v39, v40, v41, v42, v43) --[[ Line: 72 ]] --[[ Name: rasterMesh ]]
    -- upvalues: l_AssetService_0 (copy), v37 (copy), v3 (copy)
    local l_l_AssetService_0_EditableImage_0 = l_AssetService_0:CreateEditableImage({
        Size = v39
    });
    for _, v46 in v38 do
        if math.deg((math.abs((math.acos((v46.normal:Dot(v40.normal))))))) < 90 then
            local v47, v48, v49 = v37(v46.orderedVerts, l_l_AssetService_0_EditableImage_0.Size, v40, v41, v42);
            l_l_AssetService_0_EditableImage_0:DrawTriangle(v47, v48, v49, Color3.new(1, 1, 1), 0);
            v3(v43);
        end;
    end;
    return l_l_AssetService_0_EditableImage_0;
end;
return v4;