return function(_, _, v2, _) --[[ Line: 1 ]]
    if v2.clickedFaceInstance then
        return {
            v2.clickedFaceInstance
        };
    else
        return;
    end;
end;