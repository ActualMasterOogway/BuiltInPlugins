local v0 = 1;
local v2 = {
    isScale = function(_) --[[ Line: 8 ]] --[[ Name: isScale ]]
        -- upvalues: v0 (ref)
        return v0 == 1;
    end
};
v2.toggleGridType = function(_) --[[ Line: 12 ]] --[[ Name: toggleGridType ]]
    -- upvalues: v2 (copy), v0 (ref)
    if v2:isScale() then
        v0 = 2;
        print("Setting Grid mode: Offset");
        return;
    else
        v0 = 1;
        print("Setting Grid mode: Scale");
        return;
    end;
end;
v2.getScreenSize = function(_) --[[ Line: 22 ]] --[[ Name: getScreenSize ]]
    return game.Workspace.CurrentCamera.ViewportSize;
end;
return v2;