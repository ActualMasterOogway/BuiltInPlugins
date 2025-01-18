local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v4 = require(l_AnimationConversion_0.AnimationConversionManager);
local v5 = require(l_AnimationConversion_0.AnimationState);
local l_AssetType_0 = require(l_AnimationConversion_0.constants).AssetType;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v8 = require(l_Actions_0.SetAnimations);
local function v20(v9, v10, v11) --[[ Line: 18 ]] --[[ Name: addAnimations ]]
    -- upvalues: v4 (copy), v5 (copy)
    for _, v13 in v10 do
        local v14 = v4.getAnimationAssetInfo(v13.str);
        local l_id_0 = v14.id;
        local v16 = v9[l_id_0];
        if not v16 then
            local v17 = v4.getCachedName(l_id_0);
            v16 = v5.new(v14, v17 or tostring(l_id_0), v11, nil, v4.getConvertedAssetId(l_id_0));
            v11 = v11 + 1;
            v9[l_id_0] = v16;
        end;
        v16.refs[v13] = v14;
        v16.status = nil;
        for v18, _ in v16.oldRefs do
            if v18 == v13 then
                v16.oldRefs[v18] = nil;
            end;
        end;
    end;
end;
local function v30(v21, v22) --[[ Line: 47 ]] --[[ Name: removeAnimations ]]
    -- upvalues: v4 (copy), l_AssetType_0 (copy)
    for _, v24 in v22 do
        local v25 = v21[v4.getAnimationAssetInfo(v24.str).id];
        local v26 = {};
        local v27 = 0;
        if v25 then
            for v28, v29 in v25.refs do
                if v29:IsA(l_AssetType_0.AssetIdString) and v28 == v24 then
                    table.insert(v26, v28);
                end;
                v27 = v27 + 1;
            end;
            if #v26 ~= 0 then
                v25:removeRefs(v26);
            end;
        end;
    end;
end;
local function v41(v31, v32) --[[ Line: 76 ]] --[[ Name: compareAnimations ]]
    -- upvalues: v2 (copy)
    local v33 = {};
    for v34, v35 in v31 do
        if not v32[v34] then
            v33 = v2.List.join(v33, v35);
        else
            for _, v37 in v35 do
                local v38 = false;
                for _, v40 in v32[v34] do
                    if v37 == v40 then
                        v38 = true;
                        break;
                    end;
                end;
                if not v38 then
                    table.insert(v33, v37);
                end;
            end;
        end;
    end;
    return v33;
end;
return function(v42, v43) --[[ Line: 99 ]]
    -- upvalues: v41 (copy), l_deepCopy_0 (copy), v20 (copy), v30 (copy), v8 (copy)
    return function(v44) --[[ Line: 100 ]]
        -- upvalues: v41 (ref), v43 (copy), v42 (copy), l_deepCopy_0 (ref), v20 (ref), v30 (ref), v8 (ref)
        local v45 = v41(v43, v42);
        local v46 = v41(v42, v43);
        if #v45 == 0 and #v46 == 0 then
            return;
        else
            local v47 = v44:getState();
            local v48 = l_deepCopy_0(v47.AnimationConversion.animations);
            local v49 = 0;
            for _, v51 in v48 do
                if v49 <= v51.index then
                    v49 = v51.index + 1;
                end;
            end;
            v20(v48, v45, v49);
            v30(v48, v46);
            v44:dispatch(v8(v48));
            return;
        end;
    end;
end;