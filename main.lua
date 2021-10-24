local UIName = "sexyuilolev"
if game.CoreGui:FindFirstChild(UIName) then
   game.CoreGui[UIName]:Destroy() 
end 

local TargetId = 7795559412
local CurrentDialog = ""

if not game.Teams:FindFirstChild("Jury") then
    game.ReplicatedStorage.Hub.Join:InvokeServer()
    game.StarterGui:SetCore("SendNotification", {
      Title = "Eviction Notice",
      Text = "Joined game for you. Re-execute when teleported",
      Duratin = 15
    })
else
    game.StarterGui:SetCore("SendNotification", {
      Title = "Eviction Notice",
      Text = "Script started",
      Duratin = 15
    })
    game.ReplicatedStorage.Game.Dialogue.OnClientEvent:Connect(function(deez)
        CurrentDialog = deez
    end)
    print('work')
    game.ReplicatedStorage.General.Move.OnClientEvent:Connect(function(nv)
        CanWalk = nv
    end)    
   
    local cname = ""

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
           task.spawn(function()
    workspace.DescendantAdded:Connect(function(d)
        if cname == "Stratosfear" and d:IsA("TouchTransmitter") then
            task.wait(.015)
            d:Destroy()
        end
    end)
    while wait() do
        if cname ~= "Stratosfear" then
            break
        end
        for _, thing in ipairs(workspace:GetDescendants()) do
                if thing:IsA("TouchTransmitter") then
                    thing:Destroy()
                    print("destroyed" .. thing.Name)
                end    
            end    
    end    
end)  
        elseif name == "Luggage Leapers" then
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = true
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false
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
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = true
            game.ReplicatedStorage.General.Move.OnClientEvent:Wait()
            game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false
        elseif name == "Fire Escape" then
            wait(3)
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
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, water, 0)
                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, water, 1)
                    game.ReplicatedStorage.Comps["Fire Escape"].OnClientEvent:Wait()
                end
                getWater()
                repeat
                    for _, fire in ipairs(workspace:GetDescendants()) do
                    if fire:IsA("Fire") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fire.Parent, 1)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fire.Parent, 0)
                        getWater()
                    end    
                    end  
            wait(.02)
                until cname ~= "Fire Escape"
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
            for i = 30,1,-1 do
                task.spawn(function()
                    for _,touch in ipairs(workspace:GetDescendants()) do
                        if touch.Name == "Touch" then
                            firetouchinterest(game.Players.LocalPlayer.HumanoidRootPart, touch, 1)
                            task.wait(.2)
                            firetouchinterest(game.Players.LocalPlayer.HumanoidRootPart, touch, 0)
                        end
                    end
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
            local screen = workspace.House.Memorabilia.Picture
            local cache = {}
            local function hsnd(decal)
               decal.Changed:Connect(function()
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
        elseif name == "Buzz in" then
            
            local Map = workspace.House["Buzz In"]
            game.ReplicatedStorage.Comps.BuzzIn.OnClientEvent:Connect(function(...)
                wait(.2)
                local split = string.split(CurrentDialog, "less")
                print(game:GetService("HttpService"):JSONEncode(split))
            end)
            
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
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                    end    
                end
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace.House["Shape Shifters"].Return.Position)
                wait(.01)
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace.House["Shape Shifters"].Return.Position + Vector3.new(2,0,2))

                wait(.03)
            end  
        elseif Child.Name == "Burger Bustle" then
            
            print("burger")
            cname = "Burger Bustle"
            
            local List = Child:WaitForChild("List")
            
            local Hitbox = Child.Hitbox
            local Onion = Hitbox:FindFirstChild("Onion", true)
            local Cheese = Hitbox:FindFirstChild("Cheese", true)
            local Tomato = Hitbox:FindFirstChild("Tomato", true)
            local Lettuce = Hitbox:FindFirstChild("Lettuce", true)
            local Patty = Hitbox:FindFirstChild("Patty", true)
            local Bun = Hitbox:FindFirstChild("Bun", true)
            
            local ImageToStuff = {
                
                ["rbxassetid://265913845"] = "Cheese"
                
            }
            
            function MakeBurger()
                task.spawn(function()
                    firetouchinterest(game.Players.LocalPlayer.HumanoidRootPart, Bun, 0)
                    wait(.05)
                    firetouchinterest(game.Players.LocalPlayer.HumanoidRootPart, Bun, 1)
                end)
                wait(.1)
                firetouchinterest(game.Players.LocalPlayer.HumanoidRootPart, Patty, 0)
                wait(.05)
                firetouchinterest(game.Players.LocalPlayer.HumanoidRootPart, Patty, 1)
            end
            
            -- we need five burgers
            
            for i = 1, 5 do
                MakeBurger() -- make a burger (bun and patty)
            end
            
        end    
    end)
end
