return function() --[[ Line: 1 ]]
    return function(v0) --[[ Line: 2 ]]
        local l_PathReducer_0 = v0:getState().PathReducer;
        if l_PathReducer_0.SelectedObject ~= nil then
            l_PathReducer_0.SelectedObject.Closed = not l_PathReducer_0.SelectedObject.Closed;
        end;
    end;
end;