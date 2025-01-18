return {
    onEnter = function(v0, v1) --[[ Line: 7 ]] --[[ Name: onEnter ]]
        if v0 then
            v0.Icon = v1 and "rbxasset://SystemCursors/" .. v1 or "rbxasset://SystemCursors/PointingHand";
        end;
    end, 
    onLeave = function(v2) --[[ Line: 13 ]] --[[ Name: onLeave ]]
        if v2 then
            v2.Icon = "rbxasset://SystemCursors/Arrow";
        end;
    end
};