local v0 = {};
setmetatable(v0, {
    __index = function(_, v2) --[[ Line: 4 ]] --[[ Name: __index ]]
        return game:GetEngineFeature(v2);
    end
});
return v0;