local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_Workspace_0 = game:GetService("Workspace");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.CharacterHashUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.DataModelUtils);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.DEPRECATED_useTransformedSelectedInstance);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v9 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v11 = require(l_script_FirstAncestor_0.Src.Util.sanitizeModel);
local v12 = require(l_script_FirstAncestor_0.Src.Util["sha256.global"]);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v14 = require(l_script_FirstAncestor_0.Src.Hooks.useRememberLastValue);
local v15 = {};
local function _(v16) --[[ Line: 23 ]] --[[ Name: DEPRECATED_bodyMesh ]]
    -- upvalues: v5 (copy)
    if v16:IsA("MeshPart") and v16.Name:lower():match((("%*$"):format(v5.BODY_MESH_SUFFIX))) then
        return v16;
    else
        return nil;
    end;
end;
local function v22(v18) --[[ Line: 31 ]] --[[ Name: cloneInstance ]]
    -- upvalues: v10 (copy), l_Workspace_0 (copy), v11 (copy)
    assert(v10(), "getFFlagAvatarPreviewerUseAnyModel() is not enabled");
    if v18 == l_Workspace_0.Terrain or v18 == l_Workspace_0 then
        return nil;
    elseif not v18.Archivable then
        return nil;
    else
        local v19 = nil;
        pcall(function() --[[ Line: 43 ]]
            -- upvalues: v19 (ref), v18 (copy)
            v19 = v18:Clone();
        end);
        if v19 == nil then
            return nil;
        else
            for _, v21 in v19:GetDescendants() do
                if v21:IsA("Accessory") then
                    v21:Remove();
                end;
            end;
            v11(v19);
            return v19;
        end;
    end;
end;
local function v30(v23, v24, v25) --[[ Line: 60 ]] --[[ Name: createAutoSetupTargetFromModel ]]
    -- upvalues: v10 (copy)
    assert(v10(), "getFFlagAvatarPreviewerUseAnyModel() is not enabled");
    local v26 = nil;
    if v23.PrimaryPart ~= nil then
        v26 = v23;
    else
        local l_BasePart_0 = v23:FindFirstChildWhichIsA("BasePart");
        if l_BasePart_0 == nil then
            for _, v29 in v23:GetDescendants() do
                if v29:IsA("BasePart") then
                    l_BasePart_0 = v29;
                    break;
                end;
            end;
        end;
        if l_BasePart_0 == nil then
            return nil;
        else
            v23.PrimaryPart = l_BasePart_0;
            v26 = v23;
        end;
    end;
    return {
        model = v26, 
        accessories = v24, 
        DEPRECATED_bodies = {}, 
        DEPRECATED_otherChildren = {}, 
        intendedName = v23.Name, 
        lastFilteredSelection = v25
    };
end;
local function v39() --[[ Line: 99 ]] --[[ Name: DEPRECATED_useSelectedAutoSetupTarget ]]
    -- upvalues: v10 (copy), v14 (copy), v7 (copy), v5 (copy), v15 (copy)
    assert(not v10(), "getFFlagAvatarPreviewerUseAnyModel() must be enabled");
    local v31 = v14();
    local v32 = v14();
    return v7(function(v33) --[[ Line: 105 ]]
        -- upvalues: v5 (ref), v31 (copy), v15 (ref), v32 (copy)
        local v34 = if v33:IsA("MeshPart") and v33.Name:lower():match((("%*$"):format(v5.BODY_MESH_SUFFIX))) then v33 else nil;
        if v34 ~= nil then
            return {
                accessories = {}, 
                DEPRECATED_bodies = v31({
                    v34
                }), 
                DEPRECATED_otherChildren = v15
            };
        else
            if v33:IsA("Model") then
                local v35 = {
                    accessories = {}, 
                    DEPRECATED_bodies = {}, 
                    DEPRECATED_otherChildren = {}, 
                    intendedName = v33.Name
                };
                for _, v37 in v33:GetChildren() do
                    local v38 = if v37:IsA("MeshPart") and v37.Name:lower():match((("%*$"):format(v5.BODY_MESH_SUFFIX))) then v37 else nil;
                    if v38 ~= nil then
                        table.insert(v35.DEPRECATED_bodies, v38);
                    else
                        table.insert(v35.DEPRECATED_otherChildren, v37);
                    end;
                end;
                v35.DEPRECATED_bodies = v31(v35.DEPRECATED_bodies);
                v35.DEPRECATED_otherChildren = v32(v35.DEPRECATED_otherChildren);
                if #v35.DEPRECATED_bodies > 0 then
                    return v35;
                end;
            end;
            return nil;
        end;
    end);
end;
local function v43(v40, v41) --[[ Line: 145 ]] --[[ Name: isValidTargetForSelectedAvatar ]]
    -- upvalues: l_Workspace_0 (copy)
    if v41:IsA("Accessory") or v41:FindFirstAncestorWhichIsA("Accessory") then
        return true;
    elseif v41:FindFirstChildWhichIsA("FaceControls") then
        return true;
    elseif not v41:IsDescendantOf(l_Workspace_0) then
        return true;
    elseif v40 == nil then
        return false;
    else
        local l_WorldModel_0 = v40.WorldModel;
        if v41 == l_WorldModel_0 or v41:IsDescendantOf(l_WorldModel_0) then
            return true;
        else
            return false;
        end;
    end;
end;
local function v49(v44) --[[ Line: 172 ]] --[[ Name: cloneAccessories ]]
    -- upvalues: v22 (copy)
    local v45 = {};
    for _, v47 in v44:GetDescendants() do
        if v47:IsA("Accessory") or v47:IsA("BodyColors") or v47:IsA("Clothing") then
            local v48 = v22(v47);
            if v48 ~= nil then
                table.insert(v45, v48);
            end;
        end;
    end;
    return v45;
end;
return function(v50) --[[ Line: 194 ]] --[[ Name: useSelectedAutoSetupTarget ]]
    -- upvalues: v10 (copy), v39 (copy), v9 (copy), v3 (copy), l_Workspace_0 (copy), v43 (copy), v13 (copy), v4 (copy), v12 (copy), v8 (copy), v6 (copy), v49 (copy), v22 (copy), v30 (copy)
    if not v10() then
        return v39();
    else
        local v51 = v9:use():get();
        local v56 = v3.useCallback(function() --[[ Line: 201 ]]
            -- upvalues: v51 (copy), l_Workspace_0 (ref), v43 (ref), v50 (copy)
            local v52 = v51:Get();
            if #v52 == 0 then
                return nil;
            else
                local v53 = {};
                for _, v55 in v52 do
                    if v55 ~= l_Workspace_0 and not v43(v50, v55) then
                        table.insert(v53, v55);
                    end;
                end;
                return v53;
            end;
        end, {
            v51, 
            v50
        });
        local v57, v58 = v3.useState(v56);
        v13(v51.SelectionChanged, function() --[[ Line: 225 ]]
            -- upvalues: v58 (copy), v56 (copy)
            v58(v56());
        end, {
            v56, 
            v51
        });
        local v63 = v3.useCallback(function() --[[ Line: 229 ]]
            -- upvalues: v57 (copy), v4 (ref), v12 (ref)
            if v57 == nil then
                return {};
            else
                local v59 = {};
                local v60 = v4.computeHashSerializeContext(v57, {
                    ignoreUniformScaleChanges = false, 
                    ignoreAccessories = true
                });
                for _, v62 in v57 do
                    table.insert(v59, (v4.hashCharacter(v62, v60)));
                end;
                return {
                    hash = v12(table.concat(v59, ",")), 
                    lastFilteredSelection = v57
                };
            end;
        end, {
            v57
        });
        local v64, v65 = v3.useState(v63);
        v3.useEffect(function() --[[ Line: 254 ]]
            -- upvalues: v57 (copy), v65 (copy), v8 (ref), v6 (ref), v63 (copy)
            if v57 == nil then
                v65({});
                return nil;
            else
                local v66 = v8.new();
                for _, v68 in v57 do
                    v66:giveTask(v6.throttleDeferWatchForChanges(v68, function() --[[ Line: 263 ]]
                        -- upvalues: v65 (ref), v63 (ref)
                        v65(v63());
                    end));
                end;
                v65(v63());
                return function() --[[ Line: 270 ]]
                    -- upvalues: v66 (copy)
                    v66:destroy();
                end;
            end;
        end, {
            v63
        });
        local v82 = v3.useMemo(function() --[[ Line: 275 ]]
            -- upvalues: v64 (copy), v49 (ref), v22 (ref), v30 (ref)
            if v64.lastFilteredSelection == nil then
                return nil;
            else
                if #v64.lastFilteredSelection == 1 then
                    local v69 = v64.lastFilteredSelection[1];
                    if v69:IsA("Model") then
                        local v70 = v49(v69);
                        local v71 = v22(v69);
                        if v71 == nil then
                            return nil;
                        else
                            return (v30(v71, v70, v64.lastFilteredSelection));
                        end;
                    elseif v69:IsA("BasePart") then
                        local v72 = v22(v69);
                        if v72 == nil then
                            return nil;
                        else
                            local v73 = v49(v69);
                            local l_Model_0 = Instance.new("Model");
                            l_Model_0.PrimaryPart = v72;
                            l_Model_0.Name = v72.Name;
                            v72.Parent = l_Model_0;
                            return (v30(l_Model_0, v73, v64.lastFilteredSelection));
                        end;
                    end;
                end;
                local l_Model_1 = Instance.new("Model");
                l_Model_1.Name = "Rig";
                local v76 = {};
                for _, v78 in v64.lastFilteredSelection do
                    if v78:IsA("BasePart") or v78:IsA("Folder") or v78:IsA("Model") then
                        local v79 = v22(v78);
                        if v79 ~= nil then
                            for _, v81 in v49(v78) do
                                table.insert(v76, v81);
                            end;
                            v79.Parent = l_Model_1;
                            if v79:IsA("BasePart") then
                                l_Model_1.PrimaryPart = v79;
                            end;
                        end;
                    end;
                end;
                return (v30(l_Model_1, v76, v64.lastFilteredSelection));
            end;
        end, {
            v64.hash
        });
        return v82, v82 ~= nil;
    end;
end;