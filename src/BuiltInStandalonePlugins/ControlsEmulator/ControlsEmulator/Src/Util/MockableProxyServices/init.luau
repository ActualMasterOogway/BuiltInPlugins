local v1 = {
    game = game, 
    waitProxy = function(v0) --[[ Line: 3 ]] --[[ Name: waitProxy ]]
        wait(v0);
    end, 
    settingsProxy = function() --[[ Line: 6 ]] --[[ Name: settingsProxy ]]
        return settings();
    end
};
setmetatable(v1, {
    __index = function(_, v3) --[[ Line: 12 ]] --[[ Name: __index ]]
        return game:GetService(v3);
    end
});
return v1;