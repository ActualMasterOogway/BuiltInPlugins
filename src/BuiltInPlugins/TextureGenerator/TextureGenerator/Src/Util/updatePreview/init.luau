local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = {
    PreviewFront = 1, 
    Preview90 = 2, 
    Preview180 = 3, 
    Preview270 = 4
};
local function _(v5) --[[ Line: 16 ]] --[[ Name: getPreviewAngleSortOrder ]]
    -- upvalues: v4 (copy)
    return v4[v5];
end;
return function(v7, v8) --[[ Line: 20 ]] --[[ Name: updatePreview ]]
    -- upvalues: v2 (copy), v4 (copy), v1 (copy)
    local v9 = table.clone(v7[v8.uuid]);
    for v10, v11 in v8 do
        if v10 ~= "uuid" and v10 ~= "previewId" then
            v9[v10] = v11;
        end;
    end;
    if v8.previewId ~= nil then
        if v9.allPreviews == nil then
            v9.allPreviews = {
                {
                    previewId = v8.previewId, 
                    status = v8.status
                }
            };
        else
            local v12 = table.clone(v9.allPreviews);
            local v14 = v2.find(v12, function(v13) --[[ Line: 41 ]]
                -- upvalues: v8 (copy)
                return v13.previewId == v8.previewId;
            end);
            if v14 then
                v12[v14] = v8;
            else
                table.insert(v12, v8);
            end;
            table.sort(v12, function(v15, v16) --[[ Line: 51 ]]
                -- upvalues: v4 (ref)
                return v4[v15.previewAngle] < v4[v16.previewAngle];
            end);
            if v1() then
                print("all previews", v12);
            end;
            v9.allPreviews = v12;
        end;
    elseif v9.allPreviews == nil then
        v9.allPreviews = {};
    end;
    v7[v8.uuid] = v9;
end;