local v0 = false;
return function() --[[ Line: 6 ]]
    -- upvalues: v0 (ref)
    if v0 then
        return;
    else
        v0 = true;
        return;
    end;
end;