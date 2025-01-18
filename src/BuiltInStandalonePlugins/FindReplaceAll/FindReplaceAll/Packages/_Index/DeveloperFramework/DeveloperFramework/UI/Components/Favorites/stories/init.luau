local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        LowCount = v1.createElement(v2, {
            Count = 5, 
            IsFavorited = false, 
            OnClick = function() --[[ Line: 11 ]] --[[ Name: OnClick ]]

            end
        }), 
        Favorited = v1.createElement(v2, {
            Count = 10, 
            IsFavorited = true, 
            OnClick = function() --[[ Line: 16 ]] --[[ Name: OnClick ]]

            end
        }), 
        HighCount = v1.createElement(v2, {
            Count = 10500, 
            IsFavorited = false, 
            OnClick = function() --[[ Line: 21 ]] --[[ Name: OnClick ]]

            end
        })
    };
end;