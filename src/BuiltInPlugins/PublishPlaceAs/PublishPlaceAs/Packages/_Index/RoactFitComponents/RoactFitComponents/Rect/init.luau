return {
    rectangle = function(v0, v1) --[[ Line: 2 ]] --[[ Name: rectangle ]]
        return {
            top = v1, 
            bottom = v1, 
            left = v0, 
            right = v0
        };
    end, 
    square = function(v2) --[[ Line: 10 ]] --[[ Name: square ]]
        return {
            top = v2, 
            bottom = v2, 
            left = v2, 
            right = v2
        };
    end, 
    quad = function(v3, v4, v5, v6) --[[ Line: 18 ]] --[[ Name: quad ]]
        return {
            top = v3, 
            bottom = v5, 
            left = v6, 
            right = v4
        };
    end
};