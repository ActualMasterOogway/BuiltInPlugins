local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_LuaMeshEditingModule_0 = l_script_FirstAncestor_0.Packages.LuaMeshEditingModule;
local v2 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Util.createCallThrottler);
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useAsync);
local l_CageEditingContext_0 = require(l_LuaMeshEditingModule_0).MeshEditingContexts.CageEditingContext;
local l_FreeformMeshEditingComponent_0 = require(l_LuaMeshEditingModule_0).Components.FreeformMeshEditingComponent;
local _ = require(l_script_FirstAncestor_0.Packages._Index.LuaMeshEditingModule.LuaMeshEditingModule.Types);
local l_WrapUtil_0 = require(l_LuaMeshEditingModule_0).Util.WrapUtil;
local l_ContextServices_0 = v4.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_LuaMeshEditingModuleContext_0 = v2.Contexts.LuaMeshEditingModuleContext;
return function(v17) --[[ Line: 36 ]] --[[ Name: LuaMeshEditingModuleWrapper ]]
    -- upvalues: l_LuaMeshEditingModuleContext_0 (copy), l_Mouse_0 (copy), l_Plugin_0 (copy), v3 (copy), l_WrapUtil_0 (copy), v7 (copy), v5 (copy), l_CageEditingContext_0 (copy), l_FreeformMeshEditingComponent_0 (copy)
    local v18 = l_LuaMeshEditingModuleContext_0:use();
    local l_mannequin_0 = v17.mannequin;
    local v20 = l_Mouse_0:use():get();
    local v21 = l_Plugin_0:use():get();
    local v22, v23 = v3.useState(nil);
    local v29 = v3.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v18 (copy), l_mannequin_0 (copy), l_WrapUtil_0 (ref)
        local v24 = v18:getOuterCageContext();
        if v24 and l_mannequin_0 then
            for _, v26 in l_mannequin_0:GetDescendants() do
                if v26:IsA("WrapTarget") then
                    local l_Name_0 = v26.Name;
                    local v28 = v24:getVertexData()[l_Name_0];
                    v26:ModifyVertices(Enum.CageType.Outer, l_WrapUtil_0.unscaleVerticies(v26, v28));
                end;
            end;
        end;
    end, {
        l_mannequin_0
    });
    local v30 = v3.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: v7 (ref), v29 (copy), v5 (ref)
        return v7(v29, v5.THROTTLE_DELAY);
    end, {
        v29
    });
    v3.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: l_CageEditingContext_0 (ref), v17 (copy), l_mannequin_0 (copy), v18 (copy), v23 (copy), v30 (copy)
        local v31 = l_CageEditingContext_0.new();
        v17.outerCageContextRef.current = v31;
        v31:initFromCageMesh(Enum.CageType.Outer, l_mannequin_0);
        v18:setOuterCageContext(v31);
        v18:setCurrentTool("BrushTool");
        v18:changeEditingCage(Enum.CageType.Outer);
        v23(v18:getCurrentTool());
        local v32 = v31:getMeshDataChangedSignal():Connect(function() --[[ Line: 74 ]]
            -- upvalues: v30 (ref)
            v30();
        end);
        return function() --[[ Line: 78 ]]
            -- upvalues: v32 (copy), v18 (ref), v23 (ref), v17 (ref)
            v32:Disconnect();
            v18:cleanup();
            v23(nil);
            v17.outerCageContextRef.current = nil;
        end;
    end, {
        l_mannequin_0
    });
    v3.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v17 (copy)
        local l_current_0 = v17.outerCageContextRef.current;
        assert(l_current_0 ~= nil, "No outerCageContext");
        if v17.segmentationMap.state ~= "ok" then
            return;
        else
            l_current_0:setSegmentationMap(v17.segmentationMap.value);
            if not v17.symmetrical then
                return nil;
            elseif v17.symmetryMap.state ~= "ok" then
                return;
            else
                assert(v17.symmetryMap.state == "ok", "Luau");
                l_current_0:setSymmetryMap(v17.symmetryMap.value);
                return function() --[[ Line: 109 ]]
                    -- upvalues: l_current_0 (copy)
                    l_current_0:setSegmentationMap({});
                    l_current_0:setSymmetryMap({});
                end;
            end;
        end;
    end, {
        v17.symmetrical, 
        v17.symmetryMap, 
        v17.segmentationMap
    });
    return v22 and v3.createElement(l_FreeformMeshEditingComponent_0, {
        Mouse = v20, 
        Plugin = v21, 
        VertexToolBase = v22, 
        Radius = v17.radius, 
        Falloff = v17.falloff, 
        Mannequin = l_mannequin_0, 
        OnChangeSelectedPositions = v17.onChangeSelectedPositions
    });
end;