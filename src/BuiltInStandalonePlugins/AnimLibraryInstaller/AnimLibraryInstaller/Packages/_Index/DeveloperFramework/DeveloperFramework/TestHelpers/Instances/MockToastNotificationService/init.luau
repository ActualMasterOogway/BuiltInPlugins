local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.Destroy = function(_) --[[ Line: 9 ]] --[[ Name: Destroy ]]

end;
v0.ShowNotification = function(_, _, _) --[[ Line: 11 ]] --[[ Name: ShowNotification ]]

end;
v0.HideNotification = function(_, _) --[[ Line: 13 ]] --[[ Name: HideNotification ]]

end;
return v0;