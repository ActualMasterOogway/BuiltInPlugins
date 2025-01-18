local v0 = require(script.Parent.BoundingBoxUtils);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v3 (copy), v2 (copy)
    local v6 = setmetatable(v0.computeInfo(v4, v5), v3);
    v6.joints = v6.draggerContext.RootInstance and v2.getJoints(v6.parts, v6.draggerContext.RootInstance) or nil;
    return v6;
end;
v3.isEmpty = function(v7) --[[ Line: 15 ]] --[[ Name: isEmpty ]]
    local v8 = false;
    if #v7.parts == 0 then
        v8 = false;
        if #v7.attachments == 0 then
            v8 = #v7.bones == 0;
        end;
    end;
    return v8;
end;
v3.getBoundingBox = function(v9) --[[ Line: 19 ]] --[[ Name: getBoundingBox ]]
    local v10 = v9.draggerContext:shouldUseLocalSpace();
    local v11 = #v9.parts > 0;
    local v12 = v11 and v9.joints or v9.bones;
    if #v12 > 0 then
        local v13 = v12[#v12];
        if not v11 then
            if v10 then
                return v13.TransformedWorldCFrame, Vector3.new(), (Vector3.new());
            else
                return CFrame.new(v13.TransformedWorldCFrame.Position), Vector3.new(), (Vector3.new());
            end;
        elseif v13.Part1 ~= nil then
            if v10 then
                return v13.Part1.CFrame * v13.C1, Vector3.new(), (Vector3.new());
            else
                return CFrame.new((v13.Part1.CFrame * v13.C1).Position), Vector3.new(), (Vector3.new());
            end;
        end;
    end;
    return v9.basisCFrame, v9.boundingBoxOffset, v9.boundingBoxSize;
end;
v3.doesContainItem = function(v14, v15) --[[ Line: 45 ]] --[[ Name: doesContainItem ]]
    return v14.partSet[v15] ~= nil;
end;
v3.isDynamic = function(_) --[[ Line: 49 ]] --[[ Name: isDynamic ]]
    return false;
end;
v3.getObjectsToTransform = function(v17) --[[ Line: 53 ]] --[[ Name: getObjectsToTransform ]]
    local l_parts_0 = v17.parts;
    for _, v20 in ipairs(v17.bones) do
        table.insert(l_parts_0, v20);
    end;
    return l_parts_0, v17.attachments;
end;
v3.getAllAttachments = function(v21) --[[ Line: 61 ]] --[[ Name: getAllAttachments ]]
    return v21.allAttachments;
end;
return v3;