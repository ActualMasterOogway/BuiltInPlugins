local l_HttpService_0 = game:GetService("HttpService");
local l_Workspace_0 = game.Workspace;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.getDescendants);
return {
    initTempCageData = function(_, v5) --[[ Line: 14 ]] --[[ Name: initTempCageData ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_WrapLayer_0 = v5:FindFirstChildWhichIsA("WrapLayer");
        if not l_WrapLayer_0 then
            return;
        else
            local l_Parent_1 = v5.Parent;
            v5.Parent = l_Workspace_0;
            local _, l_result_0 = pcall(function() --[[ Line: 23 ]]
                -- upvalues: l_WrapLayer_0 (copy)
                l_WrapLayer_0:GetVertices(Enum.CageType.Outer);
                l_WrapLayer_0:GetVertices(Enum.CageType.Inner);
            end);
            if l_result_0 then
                print(l_result_0);
            end;
            v5.Parent = l_Parent_1;
            return;
        end;
    end, 
    deformClothing = function(_, v11, v12, v13) --[[ Line: 33 ]] --[[ Name: deformClothing ]]
        local l_WrapLayer_1 = v11:FindFirstChildWhichIsA("WrapLayer");
        if not l_WrapLayer_1 or not v12 or not v13 then
            return;
        else
            local _, l_result_1 = pcall(function() --[[ Line: 39 ]]
                -- upvalues: l_WrapLayer_1 (copy), v13 (copy), v12 (copy)
                l_WrapLayer_1:ModifyVertices(v13, v12[l_WrapLayer_1.Name]);
            end);
            if l_result_1 then
                print(l_result_1);
            end;
            return;
        end;
    end, 
    deformBody = function(_, v18, v19, v20) --[[ Line: 47 ]] --[[ Name: deformBody ]]
        -- upvalues: v3 (copy)
        if not v19 or not v20 then
            return;
        else
            local v21 = v3({}, v18);
            for _, v23 in ipairs(v21) do
                if v23:IsA("WrapTarget") and v19[v23.Name] then
                    local _, l_result_2 = pcall(function() --[[ Line: 55 ]]
                        -- upvalues: v23 (copy), v20 (copy), v19 (copy)
                        v23:ModifyVertices(v20, v19[v23.Name]);
                    end);
                    if l_result_2 then
                        print(l_result_2);
                    end;
                end;
            end;
            return;
        end;
    end, 
    makeDeformerNamesUnique = function(_, v27) --[[ Line: 65 ]] --[[ Name: makeDeformerNamesUnique ]]
        -- upvalues: v3 (copy), l_HttpService_0 (copy)
        if not v27 then
            return;
        else
            local v28 = v3({}, v27);
            for _, v30 in ipairs(v28) do
                if v30:IsA("BaseWrap") then
                    v30.Name = l_HttpService_0:GenerateGUID();
                end;
            end;
            return;
        end;
    end, 
    renameDeformers = function(_, v32, v33) --[[ Line: 78 ]] --[[ Name: renameDeformers ]]
        -- upvalues: v3 (copy)
        if not v32 or not v33 then
            return;
        else
            v32.Name = v33.Name;
            local v34 = v3({}, v32);
            for _, v36 in ipairs(v34) do
                if v36:IsA("BaseWrap") then
                    local l_Name_0 = v36.Parent.Name;
                    if l_Name_0 == "Part" or l_Name_0 == "MeshPart" then
                        l_Name_0 = "";
                    end;
                    v36.Name = l_Name_0 .. v36.ClassName;
                end;
            end;
            return;
        end;
    end, 
    setAutoSkinningBehavior = function(_, v39, v40) --[[ Line: 97 ]] --[[ Name: setAutoSkinningBehavior ]]
        if not v39 then
            return;
        else
            local l_WrapLayer_2 = v39:FindFirstChildWhichIsA("WrapLayer");
            if not l_WrapLayer_2 then
                return;
            else
                l_WrapLayer_2.AutoSkin = v40;
                return;
            end;
        end;
    end, 
    getAutoSkinningBehavior = function(_, v43) --[[ Line: 110 ]] --[[ Name: getAutoSkinningBehavior ]]
        if not v43 then
            return;
        else
            local l_WrapLayer_3 = v43:FindFirstChildWhichIsA("WrapLayer");
            if not l_WrapLayer_3 then
                return;
            else
                return l_WrapLayer_3.AutoSkin;
            end;
        end;
    end
};