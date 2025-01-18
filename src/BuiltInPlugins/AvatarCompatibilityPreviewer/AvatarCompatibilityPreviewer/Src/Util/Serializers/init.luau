local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.LuaMeshEditingModule);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Util.getPaletteFromKey);
local l_deepCopy_0 = v3.Util.deepCopy;
local _ = v4.MeshEditingContexts.MeshEditingContextBase;
local v21 = {
    createEquippedItemsSerializer = function(v10) --[[ Line: 38 ]] --[[ Name: createEquippedItemsSerializer ]]
        -- upvalues: l_HttpService_0 (copy), v2 (copy), v5 (copy), v7 (copy)
        return {
            serialize = function(v11) --[[ Line: 42 ]] --[[ Name: serialize ]]
                -- upvalues: l_HttpService_0 (ref), v2 (ref), v5 (ref)
                return l_HttpService_0:JSONEncode(v2.map(v11, function(v12) --[[ Line: 44 ]]
                    -- upvalues: v5 (ref)
                    local v13 = nil;
                    if v12.item.source == v5.SOURCE_BUILTIN then
                        v13 = {
                            source = v5.SOURCE_BUILTIN, 
                            builtinItem = if v12.palette.Serializer then v12.palette.Serializer.serialize(v12.item.builtinItem) else v12.item.builtinItem
                        };
                    elseif v12.item.source == v5.SOURCE_INSTANCE then
                        v13 = {
                            source = v5.SOURCE_INSTANCE, 
                            key = v12.item.instance.Name
                        };
                    else
                        error((("Unknown item source in serialization: %*"):format(v12.item.source)));
                    end;
                    return {
                        palette = v12.palette.Key, 
                        item = v13, 
                        isHidden = v12.isHidden
                    };
                end));
            end, 
            deserialize = function(v14) --[[ Line: 73 ]] --[[ Name: deserialize ]]
                -- upvalues: l_HttpService_0 (ref), v2 (ref), v7 (ref), v5 (ref), v10 (copy)
                local v15 = l_HttpService_0:JSONDecode(v14);
                return v2.collectArray(v15, function(_, v17) --[[ Line: 78 ]]
                    -- upvalues: v7 (ref), v5 (ref), v10 (ref)
                    local v18 = v7(v17.palette);
                    if v18 == nil then
                        return nil;
                    else
                        assert(v18 ~= nil, v5.LUAU_ANALYZE_ERROR);
                        local v19 = nil;
                        if v17.item.source == v5.SOURCE_BUILTIN then
                            v19 = {
                                source = v5.SOURCE_BUILTIN, 
                                builtinItem = if v18.Serializer then v18.Serializer.deserialize(v17.item.builtinItem) else v17.item.builtinItem
                            };
                        elseif v17.item.source == v5.SOURCE_INSTANCE then
                            local l_v10_FirstChild_0 = v10:FindFirstChild(v17.item.key);
                            if l_v10_FirstChild_0 == nil then
                                return nil;
                            else
                                v19 = {
                                    source = v5.SOURCE_INSTANCE, 
                                    instance = l_v10_FirstChild_0
                                };
                            end;
                        else
                            error((("Unknown item source in deserialization: %*"):format(v17.item.source)));
                        end;
                        return {
                            palette = v18, 
                            item = v19, 
                            isHidden = v17.isHidden
                        };
                    end;
                end);
            end
        };
    end
};
local function v26(v22) --[[ Line: 119 ]] --[[ Name: serializeListOfVectors ]]
    local v23 = {};
    for v24, v25 in v22 do
        v23[tostring(v24)] = {
            v25.X, 
            v25.Y, 
            v25.Z
        };
    end;
    return v23;
end;
local function v31(v27) --[[ Line: 128 ]] --[[ Name: deserializeListOfVectors ]]
    local v28 = {};
    for v29, v30 in v27 do
        v28[tonumber(v29)] = Vector3.new(v30[1], v30[2], v30[3]);
    end;
    return v28;
end;
v21.cageMeshesDataSerializer = {
    serialize = function(v32) --[[ Line: 138 ]] --[[ Name: serialize ]]
        -- upvalues: v26 (copy), l_HttpService_0 (copy)
        local v33 = {};
        for v34, v35 in v32 do
            v33[v34] = {};
            for v36, v37 in v35 do
                if v36 == "MeshOrigin" then
                    v33[v34][v36] = {
                        v37:GetComponents()
                    };
                elseif v36 == "VertexData" then
                    v33[v34][v36] = v26(v37);
                else
                    v33[v34][v36] = v37;
                end;
            end;
        end;
        return l_HttpService_0:JSONEncode(v33);
    end, 
    deserialize = function(v38) --[[ Line: 157 ]] --[[ Name: deserialize ]]
        -- upvalues: l_HttpService_0 (copy), v31 (copy)
        local v39 = l_HttpService_0:JSONDecode(v38);
        for v40, v41 in v39 do
            v39[v40].MeshOrigin = CFrame.new(unpack(v39[v40].MeshOrigin));
            v41.VertexData = v31(v41.VertexData);
        end;
        return v39;
    end
};
v21.cageHistorySerializer = {
    serialize = function(v42, v43) --[[ Line: 170 ]] --[[ Name: serialize ]]
        -- upvalues: v26 (copy), l_deepCopy_0 (copy), l_HttpService_0 (copy)
        local function v53(v44) --[[ Line: 171 ]] --[[ Name: componentizeStack ]]
            -- upvalues: v26 (ref)
            for _, v46 in v44 do
                for v47, v48 in v46.ToolStateData.ControlPointLocationData.Positions do
                    v46.ToolStateData.ControlPointLocationData.Positions[v47] = v26(v48);
                end;
                for v49, v50 in v46.ToolStateData.ControlPointLocationDataBackup.Positions do
                    v46.ToolStateData.ControlPointLocationDataBackup.Positions[v49] = v26(v50);
                end;
                for v51, v52 in v46.VertexData do
                    v46.VertexData[v51] = v26(v52);
                end;
            end;
            return v44;
        end;
        local v54 = l_deepCopy_0(v42);
        local v55 = l_deepCopy_0(v43);
        local v56 = {
            past = v53(v54), 
            future = v53(v55)
        };
        return l_HttpService_0:JSONEncode(v56);
    end, 
    deserialize = function(v57) --[[ Line: 201 ]] --[[ Name: deserialize ]]
        -- upvalues: v31 (copy), l_HttpService_0 (copy)
        local function v67(v58) --[[ Line: 202 ]] --[[ Name: decomponentizeStack ]]
            -- upvalues: v31 (ref)
            for _, v60 in v58 do
                for v61, v62 in v60.ToolStateData.ControlPointLocationData.Positions do
                    v60.ToolStateData.ControlPointLocationData.Positions[v61] = v31(v62);
                end;
                for v63, v64 in v60.ToolStateData.ControlPointLocationDataBackup.Positions do
                    v60.ToolStateData.ControlPointLocationDataBackup.Positions[v63] = v31(v64);
                end;
                for v65, v66 in v60.VertexData do
                    v60.VertexData[v65] = v31(v66);
                end;
            end;
            return v58;
        end;
        local v68 = l_HttpService_0:JSONDecode(v57);
        local l_past_0 = v68.past;
        local l_future_0 = v68.future;
        return v67(l_past_0), (v67(l_future_0));
    end
};
return v21;