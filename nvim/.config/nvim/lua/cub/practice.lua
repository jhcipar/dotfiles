-- Touch Typing Practice for Special Numeric Characters
-- Press Ctrl+C or type 'quit' to exit

math.randomseed(os.time())

-- Special characters from number row (US keyboard layout)
local special_chars = {
    '!',  -- Shift+1
    '@',  -- Shift+2
    '#',  -- Shift+3
    '$',  -- Shift+4
    '%',  -- Shift+5
    '^',  -- Shift+6
    '&',  -- Shift+7
    '*',  -- Shift+8
    '1',
    '2',
    '3',
    '4',
}

local function clear_screen()
    os.execute("cls" or "clear")  -- Works on both Windows and Unix-like systems
end

local function get_random_char()
    return special_chars[math.random(1, #special_chars)]
end

local function main()
    print("=== Special Character Touch Typing Practice ===")
    print("Type the character shown, then press Enter")
    print("Type 'quit' or press Ctrl+C to exit")
    print("Characters to practice: " .. table.concat(special_chars, " "))
    print()
    
    local correct = 0
    local total = 0
    
    while true do
        local target_char = get_random_char()
        
        io.write("Type this character: " .. target_char .. " -> ")
        io.flush()
        
        local input = io.read()
        
        -- Check for quit command
        if input == "quit" or input == "q" then
            break
        end
        
        total = total + 1
        
        if input == target_char then
            print("✓ Correct!")
            correct = correct + 1
        else
            print("✗ Wrong. Expected: '" .. target_char .. "', Got: '" .. input .. "'")
        end
        
        -- Show running score
        clear_screen()
        local accuracy = math.floor((correct / total) * 100)
        print("Score: " .. correct .. "/" .. total .. " (" .. accuracy .. "%)")
        print()
    end
    
    -- Final statistics
    print("\n=== Practice Session Complete ===")
    if total > 0 then
        local final_accuracy = math.floor((correct / total) * 100)
        print("Final Score: " .. correct .. "/" .. total .. " (" .. final_accuracy .. "%)")
    else
        print("No characters typed.")
    end
    print("Thanks for practicing!")
end

-- Run the program
main()
