# Monster Truck Godot 4 Series

*Branch:* suspension-and-scripting

## Overview
This lesson dives into setting up the car's suspension system using weight materials, scripting for real-time suspension behavior, and configuring other features like lights and movement control.

## Steps

### 1. Suspension Setup:
- *Add Marker3D to achieve the point of suspension looking towards the wheel.*
  - Place the Marker3D node to align the suspension's direction with the wheel.
- *Assign the wheel and suspension in the inspector.*
  - Link the wheel and suspension bones in the inspector for real-time behavior using the provided script.
- *Ensure the suspension bone is named correctly with respect to the car part.*
  - Verify that the suspension bones are correctly named to match the script's arguments for proper function.

### 2. Lighting Setup:
- *Set high emission for lights when the back is pressed.*
  - Use Godot’s material settings to increase emission levels on reverse, simulating brake lights.

### 3. Flip Control:
- **Set up a feature to flip the car forward or backward when Lctrl or Lalt is pressed (using code).**
  - Implement a script to handle car flips, triggered by the specified input keys.

---

## Watch, Like, and Share
If you found this tutorial helpful, please consider watching our full series on YouTube. Don't forget to *like, share, and subscribe* to support our work!

<a href="https://youtu.be/oT26ToDd35Q">
    <img src="https://github.com/Lakshman-YT/Mnstr-Trck-GDT-4-series/blob/main/Images/thunbnail.jpg" alt="YouTube Video" width="400" height="225">
</a> YouTube video

## Show Your Support
If you enjoyed this lesson, please consider giving the repository a *star* on GitHub. Your support helps us create more content like this!

---

By carefully following these steps, you'll create a responsive and realistic suspension system for your car in Godot, enhancing the overall driving experience in your game.
