local v0 = require(script.Parent.Round);
fuzzyCompare = function(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: fuzzyCompare ]]
    if not v3 then
        v3 = 1.0E-4;
    end;
    if v1 - v3 <= v2 and v2 <= v1 + v3 then
        return true;
    else
        return false;
    end;
end;
fuzzyCompareVector3 = function(v4, v5, v6) --[[ Line: 14 ]] --[[ Name: fuzzyCompareVector3 ]]
    if fuzzyCompare(v4.x, v5.x, v6) and fuzzyCompare(v4.y, v5.y, v6) and fuzzyCompare(v4.z, v5.z, v6) then
        return true;
    else
        return false;
    end;
end;
fuzzyCompareCFrame = function(v7, v8, v9) --[[ Line: 25 ]] --[[ Name: fuzzyCompareCFrame ]]
    local _, _, _, v13, v14, v15, v16, v17, v18, v19, v20, v21 = v7:components();
    local _, _, _, v25, v26, v27, v28, v29, v30, v31, v32, v33 = v8:components();
    if fuzzyCompare(v13, v25, v9) and fuzzyCompare(v14, v26, v9) and fuzzyCompare(v15, v27, v9) and fuzzyCompare(v16, v28, v9) and fuzzyCompare(v17, v29, v9) and fuzzyCompare(v18, v30, v9) and fuzzyCompare(v19, v31, v9) and fuzzyCompare(v20, v32, v9) and fuzzyCompare(v21, v33, v9) then
        return true;
    else
        return false;
    end;
end;
fuzzyRound = function(v34) --[[ Line: 47 ]] --[[ Name: fuzzyRound ]]
    -- upvalues: v0 (copy)
    return v0.roundToNearest(v34, 1.0E-4);
end;
visiblyIdentityCFrame = function(v35, _) --[[ Line: 51 ]] --[[ Name: visiblyIdentityCFrame ]]
    local _, _, _, v40, v41, v42, v43, v44, v45, v46, v47, v48 = v35:components();
    local v49 = false;
    local v50 = false;
    local v51 = false;
    if fuzzyCompare(math.abs(v40), 1) then
        if v49 then
            return false;
        else
            v49 = true;
        end;
    elseif not fuzzyCompare(v40, 0) then
        return false;
    end;
    if fuzzyCompare(math.abs(v41), 1) then
        if v49 then
            return false;
        else
            v49 = true;
        end;
    elseif not fuzzyCompare(v41, 0) then
        return false;
    end;
    if fuzzyCompare(math.abs(v42), 1) then
        if v49 then
            return false;
        else
            v49 = true;
        end;
    elseif not fuzzyCompare(v42, 0) then
        return false;
    end;
    if not v49 then
        return false;
    else
        if fuzzyCompare(math.abs(v43), 1) then
            if v50 then
                return false;
            else
                v50 = true;
            end;
        elseif not fuzzyCompare(v43, 0) then
            return false;
        end;
        if fuzzyCompare(math.abs(v44), 1) then
            if v50 then
                return false;
            else
                v50 = true;
            end;
        elseif not fuzzyCompare(v44, 0) then
            return false;
        end;
        if fuzzyCompare(math.abs(v45), 1) then
            if v50 then
                return false;
            else
                v50 = true;
            end;
        elseif not fuzzyCompare(v45, 0) then
            return false;
        end;
        if not v50 then
            return false;
        else
            if fuzzyCompare(math.abs(v46), 1) then
                if v51 then
                    return false;
                else
                    v51 = true;
                end;
            elseif not fuzzyCompare(v46, 0) then
                return false;
            end;
            if fuzzyCompare(math.abs(v47), 1) then
                if v51 then
                    return false;
                else
                    v51 = true;
                end;
            elseif not fuzzyCompare(v47, 0) then
                return false;
            end;
            if fuzzyCompare(math.abs(v48), 1) then
                if v51 then
                    return false;
                else
                    v51 = true;
                end;
            elseif not fuzzyCompare(v48, 0) then
                return false;
            end;
            if not v51 then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
return {
    fuzzyCompare = fuzzyCompare, 
    fuzzyCompareVector3 = fuzzyCompareVector3, 
    visiblyIdentityCFrame = visiblyIdentityCFrame
};