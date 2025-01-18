local l_MeshWrapperObjects_0 = script.Parent.Parent.MeshWrapperObjects;
local v1 = require(script.Parent.MeshEditingContextBase);
local v2 = require(l_MeshWrapperObjects_0.CageMeshWrapperObject);
local v3 = setmetatable({}, {
    __index = v1
});
v3.__index = v3;
v3.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v4 = setmetatable(v1.new(), v3);
    local function v9(v5, v6) --[[ Line: 20 ]] --[[ Name: _makeWrapperObjectsFromModel ]]
        -- upvalues: v2 (ref)
        if not v5 then
            return;
        else
            for _, v8 in ipairs(v5:GetDescendants()) do
                if v8:IsA("WrapTarget") then
                    table.insert(v6, v2.new(Enum.CageType.Outer, v8));
                end;
            end;
            if #v6 == 0 then
                return "Model: " .. v5.Name .. " does not contain any MeshPart(s) with a WrapTarget.";
            else
                return;
            end;
        end;
    end;
    local function v13(v10, v11) --[[ Line: 36 ]] --[[ Name: _findModelFromInstanceAndGetCages ]]
        -- upvalues: v9 (copy)
        local l_v10_FirstAncestorOfClass_0 = v10:FindFirstAncestorOfClass("Model");
        return v9(l_v10_FirstAncestorOfClass_0, v11);
    end;
    local function v20(v14, v15, v16) --[[ Line: 42 ]] --[[ Name: _getCageFromMeshPart ]]
        -- upvalues: v2 (ref), v13 (copy)
        if v14 == Enum.CageType.Inner then
            local l_WrapLayer_0 = v15:FindFirstChildOfClass("WrapLayer");
            if not l_WrapLayer_0 then
                return "MeshPart must contain a WrapLayer";
            else
                table.insert(v16, v2.new(v14, l_WrapLayer_0));
                return;
            end;
        else
            if v14 == Enum.CageType.Outer then
                local l_WrapLayer_1 = v15:FindFirstChildOfClass("WrapLayer");
                local l_WrapTarget_0 = v15:FindFirstChildOfClass("WrapTarget");
                if l_WrapLayer_1 and l_WrapTarget_0 or not l_WrapLayer_1 and not l_WrapTarget_0 then
                    return "MeshPart must contain either a WrapLayer or a WrapTarget, but not both";
                elseif l_WrapLayer_1 then
                    table.insert(v16, v2.new(v14, l_WrapLayer_1));
                    return;
                elseif l_WrapTarget_0 then
                    return v13(v15, v16);
                end;
            end;
            return;
        end;
    end;
    local function v26(v21, v22, v23) --[[ Line: 64 ]] --[[ Name: _createMeshWrapperObjects ]]
        -- upvalues: v2 (ref), v20 (copy), v9 (copy)
        if not v22 then
            error("instance is nil");
            return false;
        elseif v21 ~= Enum.CageType.Inner and v21 ~= Enum.CageType.Outer then
            error("No valid Enum.CageType was provided");
            return false;
        else
            local v24 = nil;
            if v22:IsA("WrapLayer") then
                table.insert(v23, v2.new(v21, v22));
            elseif v22:IsA("MeshPart") then
                v24 = v20(v21, v22, v23);
            elseif v21 == Enum.CageType.Outer then
                if v22:IsA("Model") then
                    v24 = v9(v22, v23);
                elseif v22:IsA("WrapTarget") then
                    local l_v22_FirstAncestorOfClass_0 = v22:FindFirstAncestorOfClass("Model");
                    v24 = v9(l_v22_FirstAncestorOfClass_0, v23);
                else
                    v24 = "Instance must be a BaseWrap, Model, or a MeshPart with a valid BaseWrap";
                end;
            else
                v24 = "Instance must be a WrapLayer or a MeshPart with a valid WrapLayer";
            end;
            if v24 then
                error(v24);
                return false;
            else
                return true;
            end;
        end;
    end;
    v4.updateCageLocationFromInstance = function(v27, v28, v29) --[[ Line: 101 ]] --[[ Name: updateCageLocationFromInstance ]]
        -- upvalues: v26 (copy)
        local v30 = {};
        if v26(v28, v29, v30) then
            v27:updateCageOrigins(v30);
        end;
    end;
    v4.initFromCageMesh = function(v31, v32, v33) --[[ Line: 109 ]] --[[ Name: initFromCageMesh ]]
        -- upvalues: v26 (copy)
        local v34 = {};
        if v26(v32, v33, v34) then
            v31:init(v34);
        end;
    end;
    return v4;
end;
return v3;