local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.VisibilityProperty);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagLCQualityCheckDisplay);
return {
    {
        Section = "ObjectGeneral", 
        Properties = {
            {
                Name = "ImportName", 
                Editable = true
            }, 
            {
                Name = "Anchored", 
                Editable = true
            }, 
            {
                Name = "UseImportedPivot", 
                Editable = true
            }
        }
    }, 
    {
        Section = "ObjectGeometry", 
        Properties = {
            {
                Name = "Dimensions", 
                Editable = false
            }, 
            {
                Name = "PolygonCount", 
                Editable = false
            }, 
            {
                Name = "DoubleSided", 
                Editable = true
            }, 
            {
                Name = "IgnoreVertexColors", 
                Editable = true
            }, 
            {
                Name = "CageNonManifoldPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v3, v4) --[[ Line: 6 ]] --[[ Name: hideIfManifold ]]
                    -- upvalues: v2 (copy)
                    if v2() then
                        if not v4:GetImportTree().UsesCages then
                            return true;
                        elseif v3.ImportName:match("_OuterCage") or v3.ImportName:match("_InnerCage") then
                            return v3.CageManifold;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "CageOverlappingVerticesPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v5, v6) --[[ Line: 18 ]] --[[ Name: hideIfNoOverlappingVertices ]]
                    -- upvalues: v2 (copy)
                    if v2() then
                        if not v6:GetImportTree().UsesCages then
                            return true;
                        elseif v5.ImportName:match("_OuterCage") or v5.ImportName:match("_InnerCage") then
                            return v5.CageNoOverlappingVertices;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "CageUVMisMatchedPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v7, v8) --[[ Line: 30 ]] --[[ Name: hideIfUVMatched ]]
                    -- upvalues: v2 (copy)
                    if v2() then
                        if not v8:GetImportTree().UsesCages then
                            return true;
                        elseif v7.ImportName:match("_OuterCage") or v7.ImportName:match("_InnerCage") then
                            return v7.CageUVMatched;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "CageMeshIntersectedPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v9, v10) --[[ Line: 42 ]] --[[ Name: hideIfCageMeshNotIntersected ]]
                    -- upvalues: v2 (copy)
                    if v2() then
                        if not v10:GetImportTree().UsesCages then
                            return true;
                        elseif v9.ImportName:match("_OuterCage") or v9.ImportName:match("_InnerCage") then
                            return v9.CageMeshNotIntersected;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "MeshHoleDetectedPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v11, v12) --[[ Line: 54 ]] --[[ Name: hideIfMeshNoHoleDetected ]]
                    -- upvalues: v2 (copy)
                    if v2() then
                        if not v12:GetImportTree().UsesCages then
                            return true;
                        elseif not v11.ImportName:match("_Att") then
                            return v11.MeshNoHoleDetected;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "IrrelevantCageModifiedPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v13, v14) --[[ Line: 67 ]] --[[ Name: hideIfNoIrrelevantCageModified ]]
                    -- upvalues: v2 (copy)
                    if v2() then
                        if not v14:GetImportTree().UsesCages then
                            return true;
                        elseif v13.ImportName:match("_OuterCage") or v13.ImportName:match("_InnerCage") then
                            return v13.NoIrrelevantCageModified;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "OuterCageFarExtendedFromMeshPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v15, v16) --[[ Line: 79 ]] --[[ Name: hideIfNoOuterCageFarExtendedFromMesh ]]
                    -- upvalues: v2 (copy)
                    if v2() then
                        if not v16:GetImportTree().UsesCages then
                            return true;
                        elseif v15.ImportName:match("_OuterCage") then
                            return v15.NoOuterCageFarExtendedFromMesh;
                        end;
                    end;
                    return true;
                end
            }
        }
    }
};