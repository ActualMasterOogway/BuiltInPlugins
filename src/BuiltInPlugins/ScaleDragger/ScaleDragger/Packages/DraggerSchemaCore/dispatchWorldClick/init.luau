local l_DraggerFramework_0 = script.Parent.Parent.DraggerFramework;
local v1 = require(l_DraggerFramework_0.Utility.getGeometry);
local v2 = require(l_DraggerFramework_0.Utility.getFaceInstance);
local v3 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
local v4 = require(l_DraggerFramework_0.Flags.getFFlagDraggerBetterCylinderSnap);
local function v19(v5, v6) --[[ Line: 11 ]] --[[ Name: snapClickPointInTarget ]]
    -- upvalues: v4 (copy)
    local l_ClickedItem_0 = v5.ClickedItem;
    local l_ClickedPosition_0 = v5.ClickedPosition;
    if l_ClickedItem_0 and l_ClickedItem_0:IsA("Part") then
        if v4() then
            if l_ClickedItem_0.Shape == Enum.PartType.Ball then
                local v9 = l_ClickedItem_0.CFrame:PointToObjectSpace(l_ClickedPosition_0);
                local v10 = math.floor(v9.X / v6 + 0.5) * v6;
                local v11 = math.floor(v9.Y / v6 + 0.5) * v6;
                local v12 = math.floor(v9.Z / v6 + 0.5) * v6;
                return l_ClickedItem_0.CFrame:PointToWorldSpace((Vector3.new(v10, v11, v12)));
            end;
        elseif l_ClickedItem_0.Shape == Enum.PartType.Ball or l_ClickedItem_0.Shape == Enum.PartType.Cylinder then
            local v13 = l_ClickedItem_0.CFrame:PointToObjectSpace(l_ClickedPosition_0);
            local v14 = math.floor(v13.X / v6 + 0.5) * v6;
            local v15 = math.floor(v13.Y / v6 + 0.5) * v6;
            local v16 = math.floor(v13.Z / v6 + 0.5) * v6;
            return l_ClickedItem_0.CFrame:PointToWorldSpace((Vector3.new(v14, v15, v16)));
        end;
    end;
    local l_TargetMatrix_0 = v5.ClickedMetadata.TargetMatrix;
    local v18 = l_TargetMatrix_0:PointToObjectSpace(v5.ClickedPosition);
    return l_TargetMatrix_0:PointToWorldSpace((Vector3.new(math.floor(v18.X / v6 + 0.5) * v6, v18.Y, math.floor(v18.Z / v6 + 0.5) * v6)));
end;
if v3() then
    local function v30(v20, v21, v22) --[[ Line: 57 ]] --[[ Name: buildFreeformDragInfo ]]
        -- upvalues: v19 (copy), v2 (copy)
        local v23 = nil;
        local v24 = nil;
        local l_ClickedItem_1 = v22.ClickedItem;
        if l_ClickedItem_1 and l_ClickedItem_1:IsA("Attachment") then
            v24 = v22.ClickedItem.WorldPosition;
            v23 = v22.ClickedItem;
        else
            v24 = if v20:getGridSnapEnabled() then v19(v22, v20:getGridSize()) else v22.ClickedPosition;
        end;
        local v26 = v21._selectionInfo:getLocalBoundingBox();
        local v27 = v26:PointToObjectSpace(v24);
        local v28 = v26:PointToObjectSpace(v22.ClickedPosition);
        if v22.ClickedMetadata.IsPivot then
            v28 = Vector3.zero;
            v27 = Vector3.zero;
        end;
        local v29 = nil;
        if not v20:isAltKeyDown() and (v22.SelectionDidContainSelectable or v22.DoubleClicked) and l_ClickedItem_1 and l_ClickedItem_1:IsA("BasePart") then
            v29 = v2(v22.ClickedItem, v22.ClickedPosition);
        end;
        return {
            draggedPoint = v27, 
            clickedPoint = v28, 
            clickedMetadata = v22.ClickedMetadata, 
            clickedFaceInstance = v29, 
            attachmentBeingDragged = v23
        };
    end;
    return function(v31, v32, v33) --[[ Line: 106 ]]
        -- upvalues: v30 (copy)
        local l_ClickedItem_2 = v33.ClickedItem;
        if l_ClickedItem_2 and (l_ClickedItem_2:IsA("Constraint") or l_ClickedItem_2:IsA("WeldConstraint") or l_ClickedItem_2:IsA("NoCollisionConstraint")) then
            return "Ready";
        elseif v33.SelectionNowContainsSelectable then
            if v32:doesAllowFreeformDrag() then
                if not v33.ClickedPosition then
                    return "Ready";
                else
                    return "FreeformSelectionDrag", (v30(v31, v32, v33));
                end;
            else
                return "Ready";
            end;
        else
            return "DragSelecting";
        end;
    end;
else
    local function v49(v35, v36, v37) --[[ Line: 137 ]] --[[ Name: buildFreeformDragInfo ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v38 = nil;
        local v39 = nil;
        if v37.ClickedItem:IsA("Attachment") then
            v38 = v37.ClickedItem.WorldPosition;
            v39 = v37.ClickedItem;
        else
            local v40 = v1(v37.ClickedItem, v37.ClickedPosition);
            local v41 = 1e999;
            for _, v43 in ipairs(v40.vertices) do
                local l_Magnitude_0 = (v43.position - v37.ClickedPosition).Magnitude;
                if l_Magnitude_0 < v41 then
                    v41 = l_Magnitude_0;
                    v38 = v43.position;
                end;
            end;
        end;
        local v45 = v36._selectionInfo:getLocalBoundingBox();
        local v46 = v45:PointToObjectSpace(v38);
        local v47 = v45:PointToObjectSpace(v37.ClickedPosition);
        local v48 = nil;
        if not v35:isAltKeyDown() and (v37.SelectionDidContainSelectable or v37.DoubleClicked) and v37.ClickedItem:IsA("BasePart") then
            v48 = v2(v37.ClickedItem, v37.ClickedPosition);
        end;
        return {
            basisPoint = v46, 
            clickPoint = v47, 
            clickedFaceInstance = v48, 
            attachmentBeingDragged = v39
        };
    end;
    return function(v50, v51, v52) --[[ Line: 175 ]]
        -- upvalues: v49 (copy)
        if not v52.ClickedItem then
            return "DragSelecting";
        elseif v52.ClickedItem:IsA("Constraint") or v52.ClickedItem:IsA("WeldConstraint") or v52.ClickedItem:IsA("NoCollisionConstraint") then
            return "Ready";
        elseif v52.SelectionNowContainsSelectable then
            if v51:doesAllowFreeformDrag() then
                if not v52.ClickedPosition then
                    return "Ready";
                else
                    return "FreeformSelectionDrag", (v49(v50, v51, v52));
                end;
            else
                return "Ready";
            end;
        else
            return "DragSelecting";
        end;
    end;
end;