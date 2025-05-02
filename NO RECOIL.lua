-- ================== CONFIGURATION ===================
EnableRC          = true                  -- Master switch
RequireToggle     = true                  -- Require toggle key
ToggleKey         = "CapsLock"            -- Toggle key (e.g., "CapsLock")

RecoilControlMode = "ECHO"                -- Select weapon preset

-- =============== RECOIL VALUES (Presets) ===============
local RecoilPresets = {
    ASH    = { Vertical = 63, Horizontal = -1 },
    LESION = { Vertical = 22, Horizontal =  0 },
    MIRA   = { Vertical = 27, Horizontal =  0 },
    VIGIL  = { Vertical = 36, Horizontal =  6 },
    DOC    = { Vertical = 48, Horizontal = -1 },
    VALK   = { Vertical = 18, Horizontal =  0 },
    IANA   = { Vertical = 49, Horizontal =  1 },
    ACE    = { Vertical = 54, Horizontal = -1 },
    FENRIR = { Vertical = 18, Horizontal =  1 },
    YING   = { Vertical = 42, Horizontal =  0 },
    ECHO   = { Vertical = 44, Horizontal = -1 },
    AZAMI  = { Vertical = 20, Horizontal = -1 },
    KAID   = { Vertical = 17, Horizontal =  1 },
    DEIMOS = { Vertical = 32, Horizontal = -1 },
    ZERO   = { Vertical = 58, Horizontal = -1 }
}
--ALL VALUES MADE FOR 1600 DPI 4-4 IN GAME SENS


--======== DONT CHANGE ANYTHING BELOW HERE IF YOU DONT KNOW WHAT YOUR DOING ====================

-- =================== SETUP ===========================
local Recoil         = RecoilPresets[RecoilControlMode] or { Vertical = 30, Horizontal = 0 }
local VerticalStrength = Recoil.Vertical        
local HorizontalStrength = Recoil.Horizontal    
local ShootDelay     = 7                        

EnablePrimaryMouseButtonEvents(true)            

-- ================== DISPLAY FUNCTION =================
-- Function to display messages in the log
function DisplayMessage(message)
    OutputLogMessage(message .. "\n")
end

-- ===================== MAIN LOOP ====================
function OnEvent(event, arg)
    if event == "PROFILE_ACTIVATED" then
        ClearLog()
        DisplayMessage("[Recoil Script Activated]")  -- Display activation message
        DisplayMessage(string.format("Current Preset: %s | Vertical: %d | Horizontal: %d", 
                                      RecoilControlMode, VerticalStrength, HorizontalStrength)) 
    end
    
    if EnableRC and (not RequireToggle or IsKeyLockOn(ToggleKey)) then
        if IsMouseButtonPressed(3) then           -- Aim down sights
            while IsMouseButtonPressed(3) do
                if IsMouseButtonPressed(1) then   -- Fire button
                    while IsMouseButtonPressed(1) do
                        MoveMouseRelative(HorizontalStrength, VerticalStrength)
                        Sleep(ShootDelay)
                    end
                end
                Sleep(5)
            end
        end
    end
end