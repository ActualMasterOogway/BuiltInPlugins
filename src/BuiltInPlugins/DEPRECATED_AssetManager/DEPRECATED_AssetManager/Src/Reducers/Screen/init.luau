local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Screens);
return v1.createReducer({
    screensTable = {}, 
    currentScreen = v3.MAIN, 
    previousScreens = {}, 
    nextScreens = {}
}, {
    SetScreen = function(v4, v5) --[[ Line: 19 ]] --[[ Name: SetScreen ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            currentScreen = v5.screen, 
            previousScreens = v2.Dictionary.join(v4.previousScreens, {
                [#v4.previousScreens + 1] = v4.currentScreen
            }), 
            nextScreens = {}
        });
    end, 
    SetToPreviousScreen = function(v6, _) --[[ Line: 29 ]] --[[ Name: SetToPreviousScreen ]]
        -- upvalues: v2 (copy)
        assert(#v6.previousScreens > 0, "previousScreens should not be empty");
        return v2.Dictionary.join(v6, {
            currentScreen = v6.previousScreens[#v6.previousScreens], 
            previousScreens = {
                unpack(v6.previousScreens, 1, #v6.previousScreens - 1)
            }, 
            nextScreens = v2.Dictionary.join(v6.nextScreens, {
                [#v6.nextScreens + 1] = v6.currentScreen
            })
        });
    end, 
    SetToNextScreen = function(v8, _) --[[ Line: 40 ]] --[[ Name: SetToNextScreen ]]
        -- upvalues: v2 (copy)
        assert(#v8.nextScreens > 0, "nextScreens should not be empty");
        return v2.Dictionary.join(v8, {
            currentScreen = v8.nextScreens[#v8.nextScreens], 
            previousScreens = v2.Dictionary.join(v8.previousScreens, {
                [#v8.previousScreens + 1] = v8.currentScreen
            }), 
            nextScreens = {
                unpack(v8.nextScreens, 1, #v8.nextScreens - 1)
            }
        });
    end
});