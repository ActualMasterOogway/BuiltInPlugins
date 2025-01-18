local v0 = require(script.Parent.Parent.Log);
local v1 = require(script.Parent.Parent.RectUtility);
local function v4() --[[ Line: 9 ]] --[[ Name: testPointIsInsideInMiddle ]]
    -- upvalues: v1 (copy)
    local v2 = Rect.new(Vector2.new(1, 1), Vector2.new(3, 3));
    local v3 = Vector2.new(2, 2);
    assert(v1:containsPoint(v2, v3) == true, "Point was not inside rectangle");
end;
local function v7() --[[ Line: 15 ]] --[[ Name: testPointIsOnTopSide ]]
    -- upvalues: v1 (copy)
    local v5 = Rect.new(Vector2.new(1, 1), Vector2.new(3, 3));
    local v6 = Vector2.new(2, 1);
    assert(v1:containsPoint(v5, v6) == true, "Point was not inside rectangle");
end;
local function v10() --[[ Line: 21 ]] --[[ Name: testPointIsOutsideAtOrigin ]]
    -- upvalues: v1 (copy)
    local v8 = Rect.new(Vector2.new(1, 1), Vector2.new(3, 3));
    local v9 = Vector2.new(0, 0);
    assert(v1:containsPoint(v8, v9) == false, "Point was not outside rectangle");
end;
local function v13() --[[ Line: 27 ]] --[[ Name: testPointIsOutsideOnTop ]]
    -- upvalues: v1 (copy)
    local v11 = Rect.new(Vector2.new(1, 1), Vector2.new(3, 3));
    local v12 = Vector2.new(2, 0.5);
    assert(v1:containsPoint(v11, v12) == false, "Point was not outside rectangle");
end;
local function v16() --[[ Line: 33 ]] --[[ Name: testPointIsOutsideBelow ]]
    -- upvalues: v1 (copy)
    local v14 = Rect.new(Vector2.new(1, 1), Vector2.new(3, 3));
    local v15 = Vector2.new(2, 3.5);
    assert(v1:containsPoint(v14, v15) == false, "Point was not outside rectangle");
end;
local function v19() --[[ Line: 39 ]] --[[ Name: testPointIsOutsideLeft ]]
    -- upvalues: v1 (copy)
    local v17 = Rect.new(Vector2.new(1, 1), Vector2.new(3, 3));
    local v18 = Vector2.new(0.5, 2);
    assert(v1:containsPoint(v17, v18) == false, "Point was not outside rectangle");
end;
local function v22() --[[ Line: 45 ]] --[[ Name: testPointIsOutsideRight ]]
    -- upvalues: v1 (copy)
    local v20 = Rect.new(Vector2.new(1, 1), Vector2.new(3, 3));
    local v21 = Vector2.new(0.5, 2);
    assert(v1:containsPoint(v20, v21) == false, "Point was not outside rectangle");
end;
local function _() --[[ Line: 51 ]] --[[ Name: rectUtilityTestSuite ]]
    -- upvalues: v0 (copy), v4 (copy), v7 (copy), v10 (copy), v13 (copy), v16 (copy), v19 (copy), v22 (copy)
    v0:log("Running RectUtilityTest");
    v4();
    v7();
    v10();
    v13();
    v16();
    v19();
    v22();
end;
v0:log("Running RectUtilityTest");
v4();
v7();
v10();
v13();
v16();
v19();
v22();