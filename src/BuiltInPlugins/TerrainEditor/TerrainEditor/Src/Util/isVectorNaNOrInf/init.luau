local _ = script:FindFirstAncestor("TerrainEditor");
return function(v1) --[[ Line: 4 ]] --[[ Name: isVectorNaNOrInf ]]
    if typeof(v1) == "Vector3" then
        if v1.X ~= v1.X or v1.Y ~= v1.Y or v1.Z ~= v1.Z then
            return true;
        elseif v1.X == 1e999 or v1.X == -1e999 or v1.Y == 1e999 or v1.Y == -1e999 or v1.Z == 1e999 or v1.Z == -1e999 then
            return true;
        end;
    elseif typeof(v1) == "Vector2" then
        if v1.X ~= v1.X or v1.Y ~= v1.Y then
            return true;
        elseif v1.X == 1e999 or v1.X == -1e999 or v1.Y == 1e999 or v1.Y == -1e999 then
            return true;
        end;
    end;
    return false;
end;