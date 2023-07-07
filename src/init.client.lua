-- Maui demo using Fusion with an exploit env

local CoreGui = game:GetService("CoreGui")

local Fusion = require(script.Packages.Fusion)
local Value, Observer, Computed, ForKeys, ForValues, ForPairs, new, Children, OnEvent, OnChange, Out, Ref, Cleanup, Spring, Tween = Fusion.Value, Fusion.Observer, Fusion.Computed, Fusion.ForKeys, Fusion.ForValues, Fusion.ForPairs, Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.OnChange, Fusion.Out, Fusion.Ref, Fusion.Cleanup, Fusion.Spring, Fusion.Tween

local ExecutorName = identifyexecutor()
local ValueChanges = Value(0)

if getgenv().RubiscoContainer then
    print("Found Rubisco instance! Destroying.")
    getgenv().RubiscoContainer.Parent = nil
    getgenv().RubiscoContainer = nil
end

task.spawn(function()
    for _ = 1, 50 do
        ValueChanges:set(ValueChanges:get() + 1)
        task.wait(1)
    end
end)

local RubiscoContainer = new "ScreenGui" {
    Name = "RubiscoContainer",
    Parent = CoreGui,

    [Children] = {
        new "Frame" {
            Position = UDim2.fromScale(0.2, 0.2),
            Size = UDim2.fromOffset(470, 300),
            BackgroundColor = BrickColor.new( Color3.new(0.050980, 0.058824, 0.062745) ),
            [Children] = {
                new "UICorner" {
                    CornerRadius = UDim.new(0, 10)
                },
                new "Frame" {
                    Position = UDim2.fromScale(0, 0),
                    Size = UDim2.fromScale(1, .15),
                    BackgroundColor = BrickColor.new( Color3.fromRGB(57, 61, 68) ),
                    [Children] = {
                        new "UICorner" {
                            CornerRadius = UDim.new(0, 10)
                        },
                        new "TextLabel" {
                            Text = "Rubisco Hub",
                            AnchorPoint = Vector2.new(0, 0),
                            Position = UDim2.new(.05, 0, .5, 0),
                            Size = UDim2.new(1,1),
                            TextColor = BrickColor.new( Color3.new(0.921569, 0.921569, 0.921569) ),
                            TextSize = 24,
                            BackgroundTransparency = 0,
                            BackgroundColor = BrickColor.new( Color3.new(0.270588, 0.552941, 0.592157) ),
                            TextXAlignment = 0,
                            FontFace  = Font.new("RobotoMono", Enum.FontWeight.Bold),
                        }
                    }
                },
                new "Frame" {
                    Position = UDim2.fromScale(0,1),
                    AnchorPoint = Vector2.new(0,1),
                    Size = UDim2.fromScale(.3, .85),
                    BackgroundColor3 =  Color3.new(0.215686, 0.223529, 0.258824)
                },
                new "Frame" {
                    Position = UDim2.fromScale(1,1),
                    AnchorPoint = Vector2.new(1,1),
                    Size = UDim2.fromScale(.7, .85),
                    BackgroundColor3 =  Color3.new(0.125490, 0.129412, 0.152941)
                }
            }
        }
    }
}

getgenv().RubiscoContainer = RubiscoContainer