local v3 = {
    init = function(v0) --[[ Line: 3 ]] --[[ Name: init ]]
        v0.HasPublished = false;
        v0:resetSession();
    end, 
    resetSession = function(v1) --[[ Line: 8 ]] --[[ Name: resetSession ]]
        v1.FirstAction = nil;
        v1.CurrentScreen = nil;
        v1.RigidFlow = false;
        v1.TotalLayers = 0;
        v1.TotalAvatars = 1;
        v1.CageEdits = 0;
    end, 
    reset = function(v2) --[[ Line: 17 ]] --[[ Name: reset ]]
        v2:init();
    end
};
v3:init();
return v3;