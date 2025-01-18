local v0 = require(script.Parent.Utility);
local v1 = require(script.Parent.List);
local function v6(v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: movePrimitivesDelta ]]
    if v5 then
        v2.TranslateFromTo(v2.CFrame, v2.CFrame + v3);
    else
        v2.CFrame = v2.CFrame + v3;
    end;
    return v4 + v3;
end;
local function v7(v8, v9, v10, v11, v12, v13) --[[ Line: 16 ]] --[[ Name: searchIn ]]
    -- upvalues: v1 (copy), v7 (copy)
    if math.abs(v11) < 1.0E-4 then
        return;
    else
        while true do
            if not v1.itemsHasItemNotInList(v8:GetTouchingParts(), v9) then
                v13 = v8.CFrame.p;
                if v8.CFrame.p + v10.Unit * v11 == v12 then
                    v7(v8, v9, v10, v11 * 0.5, v12, v13);
                    return;
                else
                    local v14 = v10.Unit * v11;
                    v8.CFrame = v8.CFrame + v14;
                    local _ = Vector3.new(0, 0, 0, 0) + v14;
                end;
            else
                searchOut(v8, v9, v10, v11 * -0.5, v12, v13);
                return;
            end;
        end;
    end;
end;
searchOut = function(v16, v17, v18, v19, v20, v21) --[[ Line: 33 ]] --[[ Name: searchOut ]]
    -- upvalues: v1 (copy), v7 (copy)
    if math.abs(v19) < 1.0E-4 then
        v16.CFrame = v16.CFrame - v16.CFrame.p + v21;
        return;
    else
        while true do
            if v1.itemsHasItemNotInList(v16:GetTouchingParts(), v17) then
                v20 = v16.CFrame.p;
                if v21 and v16.CFrame.p + v18.Unit * v19 == v21 then
                    searchOut(v16, v17, v18, v19 * 0.5, v20, v21);
                    return;
                else
                    local v22 = v18.Unit * v19;
                    v16.CFrame = v16.CFrame + v22;
                    local _ = Vector3.new(0, 0, 0, 0) + v22;
                end;
            else
                v7(v16, v17, v18, v19 * -0.5, v20, v21);
                return;
            end;
        end;
    end;
end;
local function v40(v24, v25) --[[ Line: 51 ]] --[[ Name: castOut ]]
    -- upvalues: v0 (copy)
    local v26 = v24.CFrame:pointToObjectSpace(v25.Origin);
    local l_Unit_0 = (v24.CFrame:pointToObjectSpace(v25.Origin + v25.Direction) - v26).Unit;
    local v28 = v24.Size / 2;
    local v29 = l_Unit_0 / Vector3.new(math.abs(l_Unit_0.X), math.abs(l_Unit_0.Y), (math.abs(l_Unit_0.Z))) * v28;
    if (v29 * 2 - v26).Magnitude < v26.Magnitude then
        return nil;
    else
        local v30 = (v29.X - v26.X) / l_Unit_0.X * l_Unit_0.Y + v26.Y;
        local v31 = (v29.X - v26.X) / l_Unit_0.X * l_Unit_0.Z + v26.Z;
        local v32 = Vector3.new(v29.X, v30, v31);
        local v33 = (v29.Y - v26.Y) / l_Unit_0.Y * l_Unit_0.X + v26.X;
        v31 = (v29.Y - v26.Y) / l_Unit_0.Y * l_Unit_0.Z + v26.Z;
        local v34 = Vector3.new(v33, v29.Y, v31);
        local v35 = Vector3.new((v29.Z - v26.Z) / l_Unit_0.Z * l_Unit_0.X + v26.X, (v29.Z - v26.Z) / l_Unit_0.Z * l_Unit_0.Y + v26.Y, v29.Z);
        local v36 = v32.Y <= v28.Y and v32.Y >= -v28.Y and v32.Z <= v28.Z and v32.Z >= -v28.Z and (v32 - v26).Magnitude or 10000;
        local v37 = v34.X <= v28.X and v34.X >= -v28.X and v34.Z <= v28.Z and v34.Z >= -v28.Z and (v34 - v26).Magnitude or 10000;
        local v38 = v35.X <= v28.X and v35.X >= -v28.X and v35.Y <= v28.Y and v35.Y >= -v28.Y and (v35 - v26).Magnitude or 10000;
        local v39 = v0.min(v36, v37, v38);
        if v39 == 10000 then
            return nil;
        elseif v39 == v36 then
            return v24.CFrame:pointToWorldSpace(v32);
        elseif v39 == v37 then
            return v24.CFrame:pointToWorldSpace(v34);
        else
            return v24.CFrame:pointToWorldSpace(v35);
        end;
    end;
end;
local function v53(v41, _, v43, v44) --[[ Line: 118 ]] --[[ Name: castMove ]]
    -- upvalues: v1 (copy), v40 (copy)
    local v45 = v1.filterOutItems(v43, v41:GetTouchingParts());
    local v46 = Ray.new(v41.CFrame.p, v44.Unit);
    local v47 = nil;
    local v48 = 0;
    for _, v50 in ipairs(v45) do
        local v51 = v40(v50, v46);
        if v51 then
            local l_Magnitude_0 = (v51 - v41.CFrame.p).Magnitude;
            if v48 < l_Magnitude_0 then
                v48 = l_Magnitude_0;
                v47 = v51;
            end;
        end;
    end;
    if v47 then
        v41.CFrame = v41.CFrame - v41.CFrame.p + v47;
    end;
end;
local function v60(v54, v55, v56) --[[ Line: 142 ]] --[[ Name: safeMove ]]
    -- upvalues: v1 (copy), v53 (copy)
    if v56.magnitude == 0 then
        return;
    else
        local v57 = v1.filterOutItems(v55, v54:GetTouchingParts());
        if #v57 > 0 and v1.listDoesNotContainType(v57, "Terrain") then
            local v58 = true;
            while v58 do
                v53(v54, 0.002, v55, v56);
                local v59 = v1.filterOutItems(v57, v1.filterOutItems(v55, v54:GetTouchingParts()));
                if #v59 == 0 then
                    v58 = false;
                else
                    v57 = v1.combineLists(v57, v59);
                end;
            end;
            searchOut(v54, v55, v56 * -1, 0 - math.min(v54.Size.X / 2, v54.Size.Y / 2, v54.Size.Z / 2), v54.CFrame.p, nil);
        end;
        return;
    end;
end;
local function v61(v62, v63, v64, v65, v66, v67, v68, v69) --[[ Line: 177 ]] --[[ Name: searchDirectionFine ]]
    -- upvalues: v1 (copy), v61 (copy)
    if v68 > 13 then
        return;
    elseif v66 <= 2.0E-4 then
        return;
    else
        local v70 = v65.Unit * v66;
        local l_v64_0 = v64;
        if v69 then
            v62.TranslateFromTo(v62.CFrame, v62.CFrame + v70);
        else
            v62.CFrame = v62.CFrame + v70;
        end;
        v64 = l_v64_0 + v70;
        if v64 ~= v64 then
            return;
        elseif v1.itemsHasItemNotInList(v62:GetTouchingParts(), v63) then
            v70 = v65.Unit * -v66;
            l_v64_0 = v64;
            if v69 then
                v62.TranslateFromTo(v62.CFrame, v62.CFrame + v70);
            else
                v62.CFrame = v62.CFrame + v70;
            end;
            v64 = l_v64_0 + v70;
            v61(v62, v63, v64, v65, v66 * 0.5, v67, v68 + 1, v69);
            return;
        else
            v61(v62, v63, v64, v65, v66, v67, v68 + 1, v69);
            return;
        end;
    end;
end;
local function v72(v73, v74, v75, v76, v77, v78) --[[ Line: 199 ]] --[[ Name: searchDirectionGross ]]
    -- upvalues: v1 (copy), v72 (copy), v61 (copy)
    if v75.Magnitude > 1000 then
        return;
    else
        local l_Unit_1 = v76.Unit;
        local l_v75_0 = v75;
        if v78 then
            v73.TranslateFromTo(v73.CFrame, v73.CFrame + l_Unit_1);
        else
            v73.CFrame = v73.CFrame + l_Unit_1;
        end;
        v75 = l_v75_0 + l_Unit_1;
        if v75 ~= v75 then
            return;
        elseif v1.itemsHasItemNotInList(v73:GetTouchingParts(), v74) then
            v72(v73, v74, v75, v76, v77, v78);
            return;
        else
            v61(v73, v74, v75, v76 * -1, 0.5, v77, 0, v78);
            return;
        end;
    end;
end;
local function _(v81, v82, v83, v84, v85) --[[ Line: 216 ]] --[[ Name: safeMoveAlongLine ]]
    -- upvalues: v1 (copy), v72 (copy)
    if v1.itemsHasItemNotInList(v81:GetTouchingParts(), v82) then
        v72(v81, v82, Vector3.new(0, 0, 0, 0), v83 * -1, v84, v85);
    end;
end;
local function v87(v88, v89, v90, v91, v92, v93, v94) --[[ Line: 223 ]] --[[ Name: searchDirectionUntilCollideGross ]]
    -- upvalues: v1 (copy), v72 (copy), v87 (copy)
    local l_Magnitude_1 = v90.Magnitude;
    if l_Magnitude_1 > 1000 then
        return false;
    else
        local l_Unit_2 = v91.Unit;
        local l_v90_0 = v90;
        if v94 then
            v88.TranslateFromTo(v88.CFrame, v88.CFrame + l_Unit_2);
        else
            v88.CFrame = v88.CFrame + l_Unit_2;
        end;
        v90 = l_v90_0 + l_Unit_2;
        if v90 ~= v90 then
            return false;
        elseif v1.itemsHasItemNotInList(v88:GetTouchingParts(), v89) then
            if v1.itemsHasItemNotInList(v88:GetTouchingParts(), v89) then
                v72(v88, v89, Vector3.new(0, 0, 0, 0), v91 * -1, v92, v94);
            end;
            return true;
        elseif v93 < l_Magnitude_1 + 1 then
            return false;
        else
            return v87(v88, v89, v90, v91, v92, v93, v94);
        end;
    end;
end;
return {
    SafeMove = v60, 
    MovePrimitivesDelta = v6, 
    moveUntilCollide = function(v98, v99, v100, v101, v102) --[[ Line: 246 ]] --[[ Name: moveUntilCollide ]]
        -- upvalues: v1 (copy), v87 (copy)
        if not v1.itemsHasItemNotInList(v98:GetTouchingParts(), v99) then
            return v87(v98, v99, Vector3.new(0, 0, 0, 0), v100, v101, v102);
        else
            return false;
        end;
    end, 
    moveUntilCollideMetapart = function(v103, v104, v105, v106) --[[ Line: 254 ]] --[[ Name: moveUntilCollideMetapart ]]
        -- upvalues: v1 (copy), v87 (copy)
        if not v1.itemsHasItemNotInList(v103:GetTouchingParts(), v104) then
            return v87(v103, v104, Vector3.new(0, 0, 0, 0), v105, 2.0E-4, v106, true);
        else
            return false;
        end;
    end
};