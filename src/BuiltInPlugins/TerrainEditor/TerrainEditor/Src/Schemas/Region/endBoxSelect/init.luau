local _ = script:FindFirstAncestor("TerrainEditor");
return function(v1) --[[ Line: 3 ]]
    v1.endSelectionOnDrag();
    v1.reachedMinimalMouseDistance = false;
end;