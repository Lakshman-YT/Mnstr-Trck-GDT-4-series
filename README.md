# Monster Truck Godot 4 Series

*Branch:* camera-and-health-setup

## Overview
This lesson covers setting up the camera, hinges for car doors and loose objects, handling movement, speedometer, and car health with damage indicators in Godot.

## Steps

### 1. Camera Setup:
- *Add a Node3D for the camera setup.*
  - Add a Spring arm (renamed from "SpringArm") as a child of Node3D.
  - Add a Camera node as the last child under the Spring arm.
  - Attach the relevant script to the camera. (This setup is commonly sourced from online tutorials.)

### 2. Hinge Setup:
- *Set the hinge's angle and other properties to your liking in the inspector.*
  - Use the hinge setup for car doors and loose objects, adjusting the constraints to control movement.
  - *Add a collision shape and disable its working.* Ensure objects are in a rigid body so that the hinge node knows what to control.

### 3. Health Setup:
- *Use a 2D TextureProgress bar to show damage.*
  - This bar visually represents the car's health, decreasing as damage is taken.

### 4. Speedometer Setup:
- *Add a 2D speedometer with a needle to show the car's speed.*
  - Script the speedometer to ensure smooth and responsive movement of the needle.

---

## Watch, Like, and Share
If you found this tutorial helpful, please consider watching our full series on YouTube. Don't forget to *like, share, and subscribe* to support our work!

[![YouTube Video](https://img.youtube.com/vi/VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=VIDEO_ID)

## Show Your Support
If you enjoyed this lesson, please consider giving the repository a *star* on GitHub. Your support helps us create more content like this!

---

Follow these steps to set up the camera, hinge, health, and speedometer systems in your Godot project. These elements will contribute significantly to the gameplay and visual feedback in your game.
