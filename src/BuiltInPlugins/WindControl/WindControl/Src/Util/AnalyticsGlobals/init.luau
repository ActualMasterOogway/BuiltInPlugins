return {
    textFieldCount = 0, 
    sliderCount = 0, 
    greenCircleCount = 0, 
    reset = function(v0) --[[ Line: 7 ]] --[[ Name: reset ]]
        v0.textFieldCount = 0;
        v0.sliderCount = 0;
        v0.greenCircleCount = 0;
    end, 
    totalCount = function(v1) --[[ Line: 13 ]] --[[ Name: totalCount ]]
        return v1.textFieldCount + v1.sliderCount + v1.greenCircleCount;
    end
};