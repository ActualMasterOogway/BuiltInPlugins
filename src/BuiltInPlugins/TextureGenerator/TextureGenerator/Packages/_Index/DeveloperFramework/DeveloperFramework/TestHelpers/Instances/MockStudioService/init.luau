local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _localUserId = 0, 
        _file = {}
    }, v0));
end;
v0.Destroy = function(_) --[[ Line: 13 ]] --[[ Name: Destroy ]]

end;
v0.GetUserId = function(v2) --[[ Line: 15 ]] --[[ Name: GetUserId ]]
    return v2._localUserId;
end;
v0.PromptImportFile = function(v3, _) --[[ Line: 19 ]] --[[ Name: PromptImportFile ]]
    return v3._file;
end;
return v0;