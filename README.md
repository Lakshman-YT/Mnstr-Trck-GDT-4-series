# Monster Truck Godot 4 Series

**Branch:** `blender-car-setup`

## Overview
In this lesson, you'll learn how to set up a car model in Blender, including creating wheels, materials for lights, mirrors, and the car body, and armature for suspension using weights and vertices. The car will then be exported as a `.glb` file for use in Godot.

## Steps

### 1. Car Model Setup:
- **Create or import your car model in Blender.**
- **Separate the car body and wheels into different objects.**
  - This ensures that each component can be manipulated individually.
- **Ensure the car model is properly scaled and oriented.**
  - Make sure the car is facing the positive Y-axis and is at the correct scale.

### 2. Material Setup:
- **Create materials for the car's body, lights, and mirrors.**
  - Use Blender's material editor to create realistic materials.
- **Assign the appropriate materials to each part of the car.**
  - Apply the car body material to the body, lights material to the lights, and mirror material to the mirrors.

### 3. Suspension Armature:
- **Add an armature to the car for suspension purposes.**
  - Insert bones where you want the suspension to be flexible.
- **Assign weights to the suspension vertices to simulate suspension behavior.**
  - Use weight painting to control how the mesh deforms with the armature.

### 4. Exporting the Model:
- **Ensure all objects and materials are correctly set up.**
  - Double-check that all components are correctly parented and that the materials are properly assigned.
- **Export the car model as a `.glb` file.**
  - Select all the relevant objects and choose `File > Export > glTF 2.0 (.glb)`.
  - Make sure to include the selected objects, apply modifiers, and export materials.

---

## Watch, Like, and Share
If you found this tutorial helpful, please consider watching our full series on YouTube. Don't forget to **like, share, and subscribe** to support our work!

[![YouTube Video](https://img.youtube.com/vi/VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=VIDEO_ID)

## Show Your Support
If you enjoyed this lesson, please consider giving the repository a **star** on GitHub. Your support helps us create more content like this!

---

Make sure to follow these steps carefully to set up the car correctly. If you're unsure about any specific step, I recommend looking up related tutorials on YouTube to guide you through the process.
