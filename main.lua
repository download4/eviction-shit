    local UIName = "sexyuilolev"
if game.CoreGui:FindFirstChild(UIName) then
   game.CoreGui[UIName]:Destroy() 
end

local TargetId = 7795559412

local NewGui = Instance.new("ScreenGui", game.CoreGui)
NewGui.Name = UIName
local MainFrame = Instance.new("Frame", NewGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(54,56,57)
MainFrame.BorderSizePixel = 0 
MainFrame.Size = UDim2.fromOffset(500,300)
MainFrame.AnchorPoint = Vector2.new(.5,.5)
MainFrame.Position = UDim2.fromScale(.5,.5)
NewGui.DisplayOrder = 694200000

local NewCorner = Instance.new("UICorner", MainFrame)
local CanWalk = true

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1,0,0,30)
Title.Position = UDim2.new(.5,0,0,15)
Title.AnchorPoint = Vector2.new(.5,0)
Title.TextScaled = true
Title.Name = "Title"
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = "GothamSemibold"
Title.Text = "Eviction Notice Gui"

local TitleUnderline = Instance.new("Frame", MainFrame)
TitleUnderline.BorderSizePixel = 0
TitleUnderline.BackgroundTransparency = .7
TitleUnderline.AnchorPoint = Vector2.new(.5,0)
TitleUnderline.Position = UDim2.new(.5,0,0,56)
TitleUnderline.Size = UDim2.new(.8,0,0,1)

if not game.Teams:FindFirstChild("Jury") then
    game.ReplicatedStorage.Hub.Join:InvokeServer()
    local NewDescription = Instance.new("TextLabel", MainFrame)
    NewDescription.Text = "Put you in the game. You should be teleported in a bit."
    NewDescription.Font = "Gotham"
    NewDescription.BackgroundTransparency = 1
    NewDescription.Position = UDim2.fromScale(.5,.5)
    NewDescription.AnchorPoint = Vector2.new(.5,.5)
    NewDescription.TextColor3 = Color3.fromRGB(255,255,255)
    NewDescription.TextWrapped = true
    NewDescription.TextSize = 20
    NewDescription.Size = UDim2.new(.85,0,.4,0)
    NewDescription.TextTransparency = .4
else
    game.ReplicatedStorage.General.Move.OnClientEvent:Connect(function(nv)
        CanWalk = nv
    end)    
    Title.Text = "Eviction Notice (Auto-Play i guess idrk)"
    game.ReplicatedStorage.Game.Dialogue.OnClientEvent:Connect(function(T)
        if string.find(T, "Congratulations") then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("gg", "All")
        end   
        if string.find(T, "nominated") and string.find(T, "eviction") then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("good luck", "All")
        end    
        if string.find(T, "not use my") then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("oh no", "All")
        end    
        if string.find(T, "nominate") and string.find(T, "2 players") then
             game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("oh noes", "All")
        end    
    end)    
    local cname = ""
    MainFrame.Active = true
    MainFrame.AnchorPoint = Vector2.new(0,0)
    MainFrame.Position = UDim2.new(0,250,0,250)
    MainFrame.Draggable = true
    local NewDescription = Instance.new("TextLabel", MainFrame)
    NewDescription.Text = "It's working! This should automatically work with all the matches. If one of them isn't detected, please tell me."
    NewDescription.Font = "Gotham"
    NewDescription.BackgroundTransparency = 1
    NewDescription.Position = UDim2.fromScale(.5,.5)
    NewDescription.AnchorPoint = Vector2.new(.5,.5)
    NewDescription.TextColor3 = Color3.fromRGB(255,255,255)
    NewDescription.TextWrapped = true
    NewDescription.TextSize = 20
    NewDescription.Size = UDim2.new(.85,0,.4,0)
    NewDescription.TextTransparency = .4
    game.ReplicatedStorage.Game.CompIntro.OnClientEvent:Connect(function(dialog)
        local text = dialog[1][8]
        local split = string.split(text, "'") or string.split(text, '"') or string.split(text, "''")
        local name = split[2]
        if name == nil then
            for _, obji in pairs(text) do
                print(objii, typeof(objii))
                if typeof(obji) == "string" then
                    if string.find(obji:lower(), "shape shifters") then
                        name = "Shape Shifters"
                    elseif string.find(obji:lower(), "baking blast") then
                        name = "Baking Blast"
                    end    
                end    
            end    
        end    
        print(name)
        cname = name
        if name == "Stratosfear" then
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            for _, thing in ipairs(workspace.House.Stratosfear.Touch:GetDescendants()) do
                if thing:IsA("TouchTransmitter") then
                    thing:Destroy()
                end    
            end    
        elseif name == "Luggage Leapers" then
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            for _, thing in ipairs(workspace:GetDescendants()) do
                if thing.Name == "Belts" and thing:IsA("Model") then
                    for _, et in ipairs(thing:GetDescendants()) do
                        if et.Name == "Main" then
                            et.Orientation += Vector3.new(0,180,0)
                        end    
                    end    
                end    
            end
        elseif name == "Sinking Feeling" then
             game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = true
            game.ReplicatedStorage.Game.Dialogue.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false
        elseif name == "Watch Your Step" then
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = true
            game.ReplicatedStorage.Game.Dialogue.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false
        elseif name == "Tile Trekkers" then
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            local cf = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()
            cf = cf + (cf.lookVector * 8)
            for i = 1, (150*4) do
                for _,v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("TouchTransmitter") then
                        task.spawn(function()
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                        wait(.05)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                    end)    
                    end    
                end
                wait(1/4)
            end   
        elseif name == "Bomboozled" then
             game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = true
            game.ReplicatedStorage.Game.Dialogue.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false
        elseif name == "Lumber Leapers" then
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            for _, thing in ipairs(workspace:GetDescendants()) do
                if thing.Name == "Belts" and thing:IsA("Model") then
                    for _, et in ipairs(thing:GetDescendants()) do
                        if et.Name == "Main" then
                            et.Orientation += Vector3.new(0,180,0)
                        end    
                    end    
                end    
            end
        elseif name == "Fire Escape" then
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            local water = nil
            local closest = 150
            for _, t in ipairs(workspace:GetDescendants()) do
                if t:IsA("BasePart") and t.Name == "Water" then
                    local mag = (t.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
                    if mag < closest then
                        closest = mag
                        water = t
                    end    
                end    
            end    
            if water then
                local function getWater()
                    water.CFrame = water.CFrame - (newCF.leftVector * 2.5)
                    game.Players.LocalPlayer.Character:MoveTo(water.Position)
                    game.ReplicatedStorage.Comps["Fire Escape"].OnClientEvent:Wait()
                end
                getWater()
                for _, fire in ipairs(workspace:GetDescendants()) do
                    if fire:IsA("Fire") then
                        local parent = fire.Parent
                    end    
                end    
            end 
        elseif name == "Power Outage" then
            local connnn = nil
            connnn = game:GetService("RunService").Heartbeat:Connect(function()
                if cname ~= "Power Outage" then
                    connnn:Disconnect()
                end    
                if CanWalk == true then
                    for _, tint in ipairs(workspace:GetDescendants()) do
                    if tint:IsA("TouchTransmitter") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, tint.Parent, 1)
                        wait(.05)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, tint.Parent, 0)
                    end    
                end    
                end    
            end)
        elseif name == "Cents of Balance" then
            wait(2)
            workspace.House["Cents of Balance"].Fall.TouchInterest:Destroy()
            local touch =  workspace.House["Cents of Balance"].Touch
            for i = 30,1,-1 do
                task.spawn(function()
                    firetouchinterest(game.Players.LocalPlayer.HumanoidRootPart, touch, 1)
                    task.wait(.2)
                    firetouchinterest(game.Players.LocalPlayer.HumanoidRootPart, touch, 0)
                end)    
                task.wait(1)
            end    
        elseif name == "Baking Blast" then
            local Model = workspace.House:WaitForChild("Baking Blast")
            local Picture = Model:WaitForChild("Picture")
            local Surface = Picture:WaitForChild("SurfaceGui")
            
            local cache = {}
            
            for _, t in ipairs(Surface:GetChildren()) do
                t:GetPropertyChangedSignal("Visible"):Connect(function()
                    if t.Visible == true then
                        print("adding",t.Name)
                        table.insert(cache, t.Name)
                    end    
                end) 
            end
            Surface.ChildAdded:Connect(function(t)
                 t:GetPropertyChangedSignal("Visible"):Connect(function()
                    if t.Visible == true then
                        print('adding',t.Name)
                        table.insert(cache, t.Name)
                    end    
                end)
            end)    
        elseif name == "Straight Shooters" then
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            for i = 1, 5 do
                for _, plr in ipairs(game.Players:GetPlayers()) do
                if plr.Character and plr ~= game.Players.LocalPlayer then
                    game.ReplicatedStorage.Comps.Health:FireServer(plr.Character:WaitForChild("Head"))
                end    
                end    
            wait(.3)
            end    
        elseif name == "Memorabilia" then
            print("doing")
            wait(3)
            local screen = workspace.NoRemove.House.Memorabilia.Picture
            local cache = {}
            local function hsnd(decal)
               decal:GetPropertyChangedSignal("Transparency"):Connect(function()
                    if decal.Transparency < .5 then
                        print('added',decal.Name)
                        table.insert(cache, decal.Name)
                    end    
                end)  
            end   
            for _, decal in ipairs(screen:GetChildren()) do
                hsnd(decal)  
            end    
            screen.ChildAdded:Connect(hsnd)
        end    
    end)    
    
    local House = workspace:WaitForChild("House")
    local DoneS = {}
    House.ChildAdded:Connect(function(Child)
        if Child.Name == "Shape Shifters" then
            cname = "Shape Shifters"
            wait(.5)
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            wait(15)
            local stop = false
            local stConn = nil
            stConn = game.ReplicatedStorage.Game.Dialogue.OnClientEvent:Connect(function()
                stConn:Disconnect()
                stop = true
            end)    
            while true do
                if stop then
                    break
                end   
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace.House["Shape Shifters"].Return.Position + Vector3.new(2,0,2))
                for _,v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("ClickDetector") and not DoneS[v.Parent.Name] then
                        fireclickdetector(v)
                        DoneS[v.Parent.Name] = true
                    end    
                end
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace.House["Shape Shifters"].Return.Position)
                wait(2.5)
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace.House["Shape Shifters"].Return.Position + Vector3.new(2,0,2))

                wait(1)
            end    
        end    
    end)    
    
end

task.spawn(function()
    while true do
        pcall(function()
            game.Players.LocalPlayer.PlayerScripts.Tilt:Destroy()
        end)    
        wait(.1)
    end
end)
