local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_join_0 = require(l_Parent_1.Dash).join;
local l_Util_0 = l_Parent_0.Util;
local v4 = require(l_Util_0.Signal);
local v5 = require(l_Util_0.buildSeamData);
local v6 = require(l_Util_0.deepCopy);
local _ = require(l_Parent_0.Types);
local v8 = require(l_Parent_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v4 (copy), v6 (copy), v5 (copy), v8 (copy), l_join_0 (copy)
    local v10 = setmetatable({}, v9);
    local v11 = nil;
    local v12 = nil;
    local v13 = v4.new();
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local function v27(v17, v18, v19) --[[ Line: 39 ]] --[[ Name: _makeVertexTriangleIndexData ]]
        local v20 = {};
        for v21, v22 in ipairs(v19) do
            for _, v24 in ipairs(v22) do
                if not v20[v24] then
                    v20[v24] = {};
                end;
                table.insert(v20[v24], v21);
            end;
        end;
        for v25, _ in ipairs(v18) do
            if not v20[v25] then
                error("Vertex index: " .. v25 .. " is not a part of any triangle in mesh: " .. v17);
            end;
        end;
        return v20;
    end;
    v10.init = function(v28, v29) --[[ Line: 62 ]] --[[ Name: init ]]
        -- upvalues: v11 (ref), v27 (copy), v14 (ref), v6 (ref), v12 (ref), v5 (ref)
        if not v29 then
            return;
        else
            v11 = {};
            for _, v31 in ipairs(v29) do
                assert(v31.instance, "MeshWrapperObject missing variable: Instance");
                assert(v31.getVertices, "MeshWrapperObject missing function: GetVertices");
                assert(v31.getTriangleIndexData, "MeshWrapperObject missing function: GetTriangleIndexData");
                assert(v31.getMeshOrigin, "MeshWrapperObject missing function: GetMeshOrigin");
                local l_Name_0 = v31.instance.Name;
                assert(v11[l_Name_0] == nil, "Instance: " .. l_Name_0 .. " shares a name with another Instance in MeshWrapperObjects, please make sure your instances are uniquely named.");
                v11[l_Name_0] = {};
                local v33 = v11[l_Name_0];
                v33.VertexData = v31:getVertices();
                v33.TriangleIndexData = v31:getTriangleIndexData();
                v33.VertexTriangleIndexData = v27(l_Name_0, v33.VertexData, v33.TriangleIndexData);
                v33.MeshOrigin = v31:getMeshOrigin();
            end;
            v14 = v6(v11);
            v12 = v5(v28, v29);
            return;
        end;
    end;
    v10.updateCageOrigins = function(_, v35) --[[ Line: 94 ]] --[[ Name: updateCageOrigins ]]
        -- upvalues: v11 (ref)
        for _, v37 in ipairs(v35) do
            assert(v37.getMeshOrigin, "MeshWrapperObject missing function: GetMeshOrigin");
            local v38 = v11[v37.instance.Name];
            if v38 then
                v38.MeshOrigin = v37:getMeshOrigin();
            end;
        end;
    end;
    v10.getMeshesData = function(_) --[[ Line: 106 ]] --[[ Name: getMeshesData ]]
        -- upvalues: v8 (ref), v6 (ref), v11 (ref)
        assert(v8(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        return v6(v11);
    end;
    v10.getVertexData = function(_) --[[ Line: 111 ]] --[[ Name: getVertexData ]]
        -- upvalues: v11 (ref), l_join_0 (ref)
        if not v11 then
            return {};
        else
            local v41 = {};
            for v42, v43 in pairs(v11) do
                v41[v42] = l_join_0(v43.VertexData);
            end;
            return v41;
        end;
    end;
    v10.getTriangleIndexData = function(_) --[[ Line: 123 ]] --[[ Name: getTriangleIndexData ]]
        -- upvalues: v11 (ref), v6 (ref)
        if not v11 then
            return {};
        else
            local v45 = {};
            for v46, v47 in pairs(v11) do
                v45[v46] = v6(v47.TriangleIndexData);
            end;
            return v45;
        end;
    end;
    v10.getVertexTriangleIndexData = function(_) --[[ Line: 135 ]] --[[ Name: getVertexTriangleIndexData ]]
        -- upvalues: v11 (ref), v6 (ref)
        if not v11 then
            return {};
        else
            local v49 = {};
            for v50, v51 in pairs(v11) do
                v49[v50] = v6(v51.VertexTriangleIndexData);
            end;
            return v49;
        end;
    end;
    v10.getSeamData = function(_) --[[ Line: 147 ]] --[[ Name: getSeamData ]]
        -- upvalues: v6 (ref), v12 (ref)
        return v6(v12);
    end;
    v10.getTriangleNormals = function(_) --[[ Line: 151 ]] --[[ Name: getTriangleNormals ]]

    end;
    v10.getVertexNormals = function(_) --[[ Line: 155 ]] --[[ Name: getVertexNormals ]]

    end;
    v10.getMeshOrigin = function(_, v56) --[[ Line: 159 ]] --[[ Name: getMeshOrigin ]]
        -- upvalues: v11 (ref)
        if not v11 or not v11[v56] then
            return;
        else
            return v11[v56].MeshOrigin;
        end;
    end;
    v10.updateVertexData = function(v57, v58) --[[ Line: 167 ]] --[[ Name: updateVertexData ]]
        -- upvalues: v11 (ref), v6 (ref), v12 (ref), v13 (copy)
        if not v11 then
            return;
        else
            local v59 = v6(v58);
            for v60, v61 in pairs(v58) do
                local v62 = v12[v60] or {};
                for v63, v64 in pairs(v61) do
                    local v65 = v62[v63] or {};
                    for _, v67 in ipairs(v65) do
                        if not v59[v67.MeshName] then
                            v59[v67.MeshName] = {};
                        elseif v59[v67.MeshName][v67.Index] then
                            continue;
                        end;
                        local v68 = v57:getMeshOrigin(v60) * v64;
                        local v69 = v57:getMeshOrigin(v67.MeshName):inverse() * v68;
                        v59[v67.MeshName][v67.Index] = v69;
                    end;
                end;
            end;
            for v70, v71 in pairs(v59) do
                local l_VertexData_0 = v11[v70].VertexData;
                if not l_VertexData_0 then
                    error("No vertex data found for mesh: " .. v70);
                else
                    for v73, v74 in pairs(v71) do
                        assert(v73 <= #l_VertexData_0, "Vertex Index out of range.");
                        l_VertexData_0[v73] = v74;
                    end;
                end;
            end;
            v13:Fire();
            return;
        end;
    end;
    v10.resetVertexData = function(_) --[[ Line: 206 ]] --[[ Name: resetVertexData ]]
        -- upvalues: v11 (ref), v6 (ref), v14 (ref), v13 (copy)
        v11 = v6(v14);
        v13:Fire();
    end;
    v10.resetVertexDataTo = function(_, v77) --[[ Line: 211 ]] --[[ Name: resetVertexDataTo ]]
        -- upvalues: v8 (ref), v11 (ref), v6 (ref), v13 (copy)
        assert(v8(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        v11 = v6(v77);
        v13:Fire();
    end;
    v10.getMeshDataChangedSignal = function(_) --[[ Line: 217 ]] --[[ Name: getMeshDataChangedSignal ]]
        -- upvalues: v13 (copy)
        return v13;
    end;
    if v8() then
        v10.getSymmetryMap = function(_) --[[ Line: 222 ]] --[[ Name: getSymmetryMap ]]
            -- upvalues: v16 (ref)
            return v16;
        end;
        v10.setSymmetryMap = function(_, v81) --[[ Line: 226 ]] --[[ Name: setSymmetryMap ]]
            -- upvalues: v16 (ref)
            v16 = v81;
        end;
        v10.getSegmentationMap = function(_) --[[ Line: 230 ]] --[[ Name: getSegmentationMap ]]
            -- upvalues: v15 (ref)
            return v15;
        end;
        v10.setSegmentationMap = function(_, v84) --[[ Line: 234 ]] --[[ Name: setSegmentationMap ]]
            -- upvalues: v15 (ref)
            v15 = v84;
        end;
    end;
    return v10;
end;
return v9;