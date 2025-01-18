local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.DefineCallout = function(_) --[[ Line: 8 ]] --[[ Name: DefineCallout ]]

end;
v0.AttachCallout = function(_) --[[ Line: 10 ]] --[[ Name: AttachCallout ]]

end;
v0.DetachCalloutsByDefinitionId = function(_) --[[ Line: 12 ]] --[[ Name: DetachCalloutsByDefinitionId ]]

end;
return v0;